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

  function initTextarea(el) {
    if (!el || el.getAttribute('data-persist-initialized') === 'true') {
      return;
    }
    el.setAttribute('data-persist-initialized', 'true');
    loadTextarea(el);
    el.addEventListener('input', debounce(function () { saveTextarea(el); }, DEBOUNCE_MS));
  }

  function initAll(root) {
    var scope = root || document;
    scope.querySelectorAll('textarea[data-persist]').forEach(initTextarea);
  }

  function reloadTextarea(el) {
    if (!el) {
      return;
    }
    el.setAttribute('data-persist-initialized', 'false');
    el.value = '';
    initTextarea(el);
  }

  // --- Wire up all [data-persist] textareas ----------------------------------

  document.addEventListener('DOMContentLoaded', function () {
    initAll(document);

    // Heartbeat: keep server watchdog alive while any page is open
    setInterval(function () { fetch('/api/ping').catch(function () {}); }, 5000);
  });

  // Flush all on tab close or navigation. Server lifetime is controlled by heartbeat.
  window.addEventListener('pagehide', function () {
    document.querySelectorAll('textarea[data-persist]').forEach(beaconTextarea);
  });

  window.tmPersistInit = initTextarea;
  window.tmPersistInitAll = initAll;
  window.tmPersistReload = reloadTextarea;

}());
