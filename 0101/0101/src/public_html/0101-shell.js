(function () {
  'use strict';

  var STATUS_PARAMS = ['launch', 'state', 'host'];

  function ready(fn) {
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', fn);
      return;
    }
    fn();
  }

  function currentFileName() {
    var parts = window.location.pathname.split('/');
    return parts[parts.length - 1] || 'index.html';
  }

  function normalizeKeyFragment(value, fallback) {
    var normalized = (value || '')
      .replace(/[^a-z0-9]+/g, '-')
      .replace(/^-+|-+$/g, '')
      .replace(/-+/g, '-');
    return normalized || fallback;
  }

  function buildPersistKey(parts) {
    var base = parts.join('-');
    if (base.length <= 64) {
      return base;
    }
    var hash = 0;
    for (var i = 0; i < base.length; i += 1) {
      hash = ((hash * 31) + base.charCodeAt(i)) >>> 0;
    }
    var suffix = hash.toString(16);
    return base.slice(0, 64 - suffix.length - 1).replace(/-+$/g, '') + '-' + suffix;
  }

  function scratchpadPageKey() {
    var path = window.location.pathname.toLowerCase().replace(/^\/+/, '') || 'index-html';
    return normalizeKeyFragment(path, 'index-html');
  }

  function currentSectorName() {
    var sectorSelect = document.getElementById('Sector');
    if (sectorSelect && sectorSelect.value) {
      return sectorSelect.value;
    }
    return localStorage.getItem('sec') || 'Spinward Marches';
  }

  function currentSystemHex() {
    var sysSelect = document.getElementById('Sys');
    if (sysSelect && sysSelect.value) {
      return sysSelect.value.toLowerCase();
    }
    try {
      var saved = localStorage.getItem('hexJSON');
      if (!saved) {
        return '';
      }
      var parsed = JSON.parse(saved);
      return parsed && parsed.hex ? String(parsed.hex).toLowerCase() : '';
    } catch (err) {
      return '';
    }
  }

  function scratchpadKeyForCurrentContext() {
    var parts = ['scratchpad', scratchpadPageKey()];
    if (currentSectorName() === 'Spinward Marches') {
      var hex = normalizeKeyFragment(currentSystemHex(), '');
      if (hex) {
        parts.push('spinward-marches', hex);
      }
    }
    return buildPersistKey(parts);
  }

  function scratchpadContextLabel() {
    if (currentSectorName() === 'Spinward Marches') {
      var hex = currentSystemHex();
      if (hex) {
        return window.location.pathname + ' - ' + hex.toUpperCase();
      }
    }
    return window.location.pathname;
  }

  function installDarkModeLock() {
    if (!document.head || document.getElementById('tm-dark-lock')) {
      return;
    }

    var style = document.createElement('style');
    style.id = 'tm-dark-lock';
    style.textContent =
      'html, body {' +
      'background: #0d1117 !important;' +
      'background-color: #0d1117 !important;' +
      'color: #e6edf3 !important;' +
      'color-scheme: dark !important;' +
      '}' +
      'body[bgcolor], table[bgcolor], tr[bgcolor], td[bgcolor], th[bgcolor], ' +
      '.w3-white, .w3-yellow, .w3-blue, .w3-red, .w3-green, .w3-grey {' +
      'background: #21262d !important;' +
      'background-color: #21262d !important;' +
      'color: #e6edf3 !important;' +
      '}' +
      '[style*="background-color: white"], [style*="background-color:white"], ' +
      '[style*="background: white"], [style*="background:white"], ' +
      '[style*="background-color: yellow"], [style*="background-color: cyan"], ' +
      '[style*="background-color: red"], [style*="background-color: green"], ' +
      '[style*="background-color: grey"], [style*="background-color: gray"] {' +
      'background: #161b22 !important;' +
      'background-color: #161b22 !important;' +
      'color: #e6edf3 !important;' +
      '}';
    document.head.appendChild(style);
  }

  function applyDarkNodeFix(node) {
    if (!node || node.nodeType !== 1) {
      return;
    }

    var isRoot = node === document.documentElement || node === document.body;
    if (isRoot) {
      node.style.setProperty('background-color', '#0d1117', 'important');
      node.style.setProperty('color', '#e6edf3', 'important');
      return;
    }

    var className = typeof node.className === 'string' ? node.className.toLowerCase() : '';
    var styleAttr = (node.getAttribute('style') || '').toLowerCase();
    var bgAttr = (node.getAttribute('bgcolor') || '').toLowerCase();
    var hasLegacyLightClass =
      className.indexOf('w3-white') !== -1 ||
      className.indexOf('w3-yellow') !== -1 ||
      className.indexOf('w3-blue') !== -1 ||
      className.indexOf('w3-red') !== -1 ||
      className.indexOf('w3-green') !== -1 ||
      className.indexOf('w3-grey') !== -1;
    var hasLegacyLightStyle =
      styleAttr.indexOf('background-color: white') !== -1 ||
      styleAttr.indexOf('background-color:white') !== -1 ||
      styleAttr.indexOf('background: white') !== -1 ||
      styleAttr.indexOf('background:white') !== -1 ||
      styleAttr.indexOf('background-color: yellow') !== -1 ||
      styleAttr.indexOf('background-color: cyan') !== -1 ||
      styleAttr.indexOf('background-color: red') !== -1 ||
      styleAttr.indexOf('background-color: green') !== -1 ||
      styleAttr.indexOf('background-color: grey') !== -1 ||
      styleAttr.indexOf('background-color: gray') !== -1;
    var hasLegacyBgAttr =
      bgAttr === 'white' ||
      bgAttr === '#ffffff' ||
      bgAttr === 'yellow' ||
      bgAttr === 'cyan' ||
      bgAttr === 'red' ||
      bgAttr === 'green' ||
      bgAttr === 'grey' ||
      bgAttr === 'gray';

    if (hasLegacyLightClass || hasLegacyLightStyle || hasLegacyBgAttr) {
      node.style.setProperty('background-color', '#161b22', 'important');
      node.style.setProperty('color', '#e6edf3', 'important');
    }
  }

  function enforceDarkMode() {
    installDarkModeLock();
    applyDarkNodeFix(document.documentElement);
    applyDarkNodeFix(document.body);

    Array.prototype.forEach.call(document.querySelectorAll('*'), function (node) {
      applyDarkNodeFix(node);
    });

    if (window.__tmDarkObserverInstalled || !window.MutationObserver || !document.body) {
      return;
    }

    var observer = new MutationObserver(function (mutations) {
      mutations.forEach(function (mutation) {
        if (mutation.type === 'childList') {
          Array.prototype.forEach.call(mutation.addedNodes, function (node) {
            applyDarkNodeFix(node);
            if (node && node.querySelectorAll) {
              Array.prototype.forEach.call(node.querySelectorAll('*'), function (child) {
                applyDarkNodeFix(child);
              });
            }
          });
          return;
        }
        applyDarkNodeFix(mutation.target);
      });
    });

    observer.observe(document.documentElement, {
      subtree: true,
      childList: true,
      attributes: true,
      attributeFilter: ['style', 'class', 'bgcolor']
    });
    window.__tmDarkObserverInstalled = true;
  }

  function preservedUrl(href) {
    if (!href || href.startsWith('#') || href.startsWith('javascript:')) {
      return href;
    }

    try {
      var url = new URL(href, window.location.href);
      if (url.origin !== window.location.origin) {
        return href;
      }
      var params = new URLSearchParams(window.location.search);
      STATUS_PARAMS.forEach(function (key) {
        if (params.has(key)) {
          url.searchParams.set(key, params.get(key));
        }
      });
      return url.toString();
    } catch (err) {
      return href;
    }
  }

  function addShellHeader() {
    if (document.querySelector('.tm-shell')) {
      return;
    }

    var page = currentFileName();
    var shell = document.createElement('div');
    shell.className = 'tm-shell';

    var header = document.createElement('header');
    header.className = 'tm-shell-header';

    var titleBlock = document.createElement('div');
    titleBlock.innerHTML =
      '<p class="tm-shell-title">0101 navigation</p>' +
      '<div class="tm-shell-subtitle">Responsive links, launch status, and tablet-friendly navigation.</div>';

    var nav = document.createElement('nav');
    nav.className = 'tm-shell-nav';
    nav.setAttribute('aria-label', '0101 navigation');

    [
      ['index.html', 'Navigator'],
      ['0101.html', 'Main view'],
      ['Sector.html', 'Sector'],
      ['Subsector.html', 'Subsector'],
      ['System.html', 'System'],
      ['indexWorlds.html', 'World index'],
      ['links.html', 'Links']
    ].forEach(function (item) {
      var link = document.createElement('a');
      link.href = preservedUrl(item[0]);
      link.textContent = item[1];
      if (page.toLowerCase() === item[0].toLowerCase()) {
        link.setAttribute('aria-current', 'page');
      }
      nav.appendChild(link);
    });

    header.appendChild(titleBlock);
    header.appendChild(nav);
    shell.appendChild(header);

    var params = new URLSearchParams(window.location.search);
    var launch = params.get('launch');
    var state = params.get('state');
    var host = params.get('host') || window.location.host || 'localhost';
    var status = document.createElement('div');
    status.className = 'tm-status-banner';
    if (launch || state) {
      status.innerHTML =
        '<strong>Launch status</strong><span>' +
        'Connected to ' + host + ' via ' + (launch || 'direct browser') +
        (state ? ' (' + state + ').' : '.') +
        '</span>';
    } else {
      status.innerHTML =
        '<strong>Current server</strong><span>' +
        'Browsing 0101 from ' + host + '.</span>';
    }
    shell.appendChild(status);

    document.body.insertBefore(shell, document.body.firstChild);
  }

  function preserveInternalLinks() {
    Array.prototype.forEach.call(document.querySelectorAll('a[href]'), function (link) {
      link.href = preservedUrl(link.getAttribute('href'));
    });
  }

  function restoreScrollPosition() {
    var key = '0101-scroll:' + window.location.pathname;
    var value = localStorage.getItem(key);
    if (!value) {
      return;
    }
    var parsed = parseInt(value, 10);
    if (!Number.isNaN(parsed)) {
      window.scrollTo(0, parsed);
    }
    window.addEventListener('pagehide', function () {
      localStorage.setItem(key, String(window.scrollY));
    });
  }

  function addClassesForLayout() {
    var controls = document.getElementById('Sector');
    if (controls && controls.parentElement) {
      controls.parentElement.classList.add('tm-control-bar');
    }

    var demo = document.getElementById('pic0');
    if (demo && demo.parentElement) {
      demo.parentElement.classList.add('tm-main-map');
    }

    Array.prototype.forEach.call(document.querySelectorAll('.w3-row'), function (row) {
      row.classList.add('tm-card-grid');
    });
  }

  function addWorldSearch() {
    var sysSelect = document.getElementById('Sys');
    if (!sysSelect || document.querySelector('.tm-search-panel')) {
      return;
    }

    var panel = document.createElement('section');
    panel.className = 'tm-shell tm-search-panel';
    panel.innerHTML =
      '<h2>Find a world</h2>' +
      '<div class="tm-search-controls">' +
      '<input id="tm-world-search" type="search" placeholder="Search by hex or world name">' +
      '<button id="tm-world-jump" type="button">Jump to selection</button>' +
      '</div>' +
      '<div class="tm-search-help" id="tm-world-search-help">Type a hex or name fragment to pick the nearest matching world in the current subsector.</div>';

    var anchor = sysSelect.parentElement;
    anchor.parentElement.insertBefore(panel, anchor.nextSibling);

    var input = document.getElementById('tm-world-search');
    var button = document.getElementById('tm-world-jump');
    var help = document.getElementById('tm-world-search-help');
    input.value = localStorage.getItem('0101-world-search') || '';

    function matchingOptions(query) {
      var normalized = query.trim().toLowerCase();
      return Array.prototype.filter.call(sysSelect.options, function (option) {
        if (!normalized) {
          return true;
        }
        var text = option.text.toLowerCase();
        return text.indexOf(normalized) !== -1 || option.value.toLowerCase().indexOf(normalized) !== -1;
      });
    }

    function jumpToMatch() {
      var matches = matchingOptions(input.value);
      localStorage.setItem('0101-world-search', input.value);
      if (!matches.length) {
        help.textContent = 'No matching world found in the current subsector.';
        return;
      }
      sysSelect.value = matches[0].value;
      help.textContent = 'Jumped to ' + matches[0].text + '.';
      if (typeof SysChange === 'function') {
        SysChange();
      } else {
        sysSelect.dispatchEvent(new Event('change'));
      }
    }

    input.addEventListener('input', function () {
      var matches = matchingOptions(input.value);
      if (!input.value.trim()) {
        help.textContent = 'Type a hex or name fragment to pick the nearest matching world in the current subsector.';
      } else {
        help.textContent = matches.length
          ? 'Press Jump to select ' + matches[0].text + '.'
          : 'No matching world found in the current subsector.';
      }
    });

    input.addEventListener('keydown', function (event) {
      if (event.key === 'Enter') {
        event.preventDefault();
        jumpToMatch();
      }
    });

    button.addEventListener('click', jumpToMatch);
  }

  function addScratchpad() {
    if (!document.body || document.querySelector('.tm-scratchpad-dock')) {
      return;
    }

    var key = scratchpadKeyForCurrentContext();
    var dock = document.createElement('section');
    dock.className = 'tm-scratchpad-dock';
    dock.innerHTML =
      '<div class="tm-scratchpad-card">' +
      '<div class="tm-scratchpad-header">' +
      '<div>' +
      '<strong>Scratchpad</strong>' +
      '<div class="tm-scratchpad-meta">' + scratchpadContextLabel() + '</div>' +
      '</div>' +
      '</div>' +
      '<textarea class="tm-scratchpad-textarea" ' +
      'id="tm-global-scratchpad" ' +
      'data-persist="' + key + '" ' +
      'placeholder="Notes for this page are saved automatically."></textarea>' +
      '</div>';

    document.body.appendChild(dock);

    var textarea = dock.querySelector('textarea[data-persist]');
    if (window.tmPersistInit) {
      window.tmPersistInit(textarea);
    }
  }

  function updateScratchpadContext() {
    var textarea = document.getElementById('tm-global-scratchpad');
    if (!textarea) {
      return;
    }

    var nextKey = scratchpadKeyForCurrentContext();
    var currentKey = textarea.getAttribute('data-persist');
    var meta = document.querySelector('.tm-scratchpad-meta');
    if (meta) {
      meta.textContent = scratchpadContextLabel();
    }
    if (currentKey === nextKey) {
      return;
    }

    textarea.setAttribute('data-persist', nextKey);
    if (window.tmPersistReload) {
      window.tmPersistReload(textarea);
    }
  }

  function bindScratchpadContextUpdates() {
    ['Sector', 'Subsector', 'Sys'].forEach(function (id) {
      var element = document.getElementById(id);
      if (!element) {
        return;
      }
      element.addEventListener('change', function () {
        window.setTimeout(updateScratchpadContext, 50);
      });
    });
  }

  ready(function () {
    enforceDarkMode();
    addShellHeader();
    preserveInternalLinks();
    restoreScrollPosition();
    addClassesForLayout();
    addWorldSearch();
    addScratchpad();
    bindScratchpadContextUpdates();
  });
}());
