/**
 * persist.js — server-backed textarea persistence
 *
 * Usage: add data-persist="unique-key" to any <textarea>, then include this
 * script. Every matching textarea is automatically loaded and saved.
 *
 *   <textarea id="my-notes" data-persist="my-notes-key"></textarea>
 *   <script src="persist.js"></script>
 *
 * Lifecycle:
 *   DOMContentLoaded  → GET /api/text/<key> for each [data-persist] textarea
 *   input (debounced) → POST updated text to server
 *   pagehide          → sendBeacon to flush any pending changes immediately
 *
 * Server endpoints (provided by server.py):
 *   GET  /api/text/<key>  → returns saved text (empty if not yet saved)
 *   POST /api/text/<key>  → saves request body
 *   GET  /api/ping        → resets server watchdog timer
 */
(function () {
  'use strict';

  var DEBOUNCE_MS = 800;

  // Tracks the last time an internal (same-origin) link was clicked.
  // Used by the pagehide handler to distinguish internal navigation from tab close.
  var _internalNavTime = 0;

  // --- Helpers ---------------------------------------------------------------

  function apiUrl(key) {
    return '/api/text/' + encodeURIComponent(key);
  }

  function loadTextarea(el) {
    var key = el.getAttribute('data-persist');
    fetch(apiUrl(key))
      .then(function (r) { return r.text(); })
      .then(function (text) { if (text) el.value = text; })
      .catch(function () { /* server not running — silent fail */ });
  }

  function saveTextarea(el) {
    var key = el.getAttribute('data-persist');
    fetch(apiUrl(key), {
      method: 'POST',
      headers: { 'Content-Type': 'text/plain' },
      body: el.value
    }).catch(function () { /* silent fail */ });
  }

  function beaconTextarea(el) {
    var key = el.getAttribute('data-persist');
    navigator.sendBeacon(apiUrl(key), new Blob([el.value], { type: 'text/plain' }));
  }

  function debounce(fn, delay) {
    var timer;
    return function () {
      var ctx = this, args = arguments;
      clearTimeout(timer);
      timer = setTimeout(function () { fn.apply(ctx, args); }, delay);
    };
  }

  // --- Wire up all [data-persist] textareas ----------------------------------

  document.addEventListener('DOMContentLoaded', function () {
    var textareas = document.querySelectorAll('textarea[data-persist]');

    textareas.forEach(function (el) {
      loadTextarea(el);
      el.addEventListener('input', debounce(function () { saveTextarea(el); }, DEBOUNCE_MS));
    });

    // Heartbeat: keep server watchdog alive while any page is open
    setInterval(function () { fetch('/api/ping').catch(function () {}); }, 5000);

    // Track internal navigation so pagehide can tell it apart from tab close.
    document.addEventListener('click', function (e) {
      var a = e.target.closest('a[href]');
      if (!a) return;
      var href = a.getAttribute('href');
      // Relative paths and same-origin absolute paths count as internal.
      if (!href || href.startsWith('#')) return;
      try {
        var url = new URL(href, window.location.href);
        if (url.origin === window.location.origin) {
          _internalNavTime = Date.now();
        }
      } catch (err) { /* malformed href — ignore */ }
    });
  });

  // Flush all on tab close or navigation; also signal server to shut down on tab/browser close.
  window.addEventListener('pagehide', function () {
    document.querySelectorAll('textarea[data-persist]').forEach(beaconTextarea);
    // If an internal link was clicked within the last 3 s this is page navigation — don't shut down.
    if (Date.now() - _internalNavTime < 3000) return;
    navigator.sendBeacon('/api/shutdown');
  });

}());
