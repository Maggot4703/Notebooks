// Minimal client viewer for 0101 Book Browser
// Fetches list of PDFs and renders per-page content into #tm-viewer

async function fetchJSON(path) {
  const resp = await fetch(path);
  if (!resp.ok) throw new Error(`${path} -> ${resp.status}`);
  return await resp.json();
}

async function listPdfs() {
  const list = await fetchJSON('/api/pdfs');
  const el = document.getElementById('tm-pdf-list');
  el.innerHTML = '';
  for (const item of list) {
    const btn = document.createElement('button');
    btn.textContent = `${item.title || item.name} (${item.page_count || ''}p)`;
    btn.onclick = () => openPdf(item.id);
    el.appendChild(btn);
  }
}

let currentPdf = null;
let currentPage = 1;
let currentSearch = '';
let caseSensitive = false;

function escapeHtml(s) {
  return s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
}

function highlightText(text, query) {
  if (!query) return escapeHtml(text);
  const flags = caseSensitive ? 'g' : 'gi';
  try {
    const re = new RegExp(query.replace(/[.*+?^${}()|[\\]\\]/g, '\\$&'), flags);
    return escapeHtml(text).replace(re, (m) => `<mark style="background:rgba(255,205,0,0.35)">${m}</mark>`);
  } catch (e) {
    return escapeHtml(text);
  }
}

async function openPdf(id) {
  currentPdf = id;
  const meta = await fetchJSON(`/api/pdf/${encodeURIComponent(id)}/pages`);
  currentPage = 1;
  document.getElementById('tm-pdf-title').textContent = meta.id;
  renderPage(currentPdf, currentPage);
}

async function renderPage(pdfId, pageNum) {
  const data = await fetchJSON(`/api/pdf/${encodeURIComponent(pdfId)}/page/${pageNum}/content`);
  const viewer = document.getElementById('tm-viewer');
  viewer.innerHTML = '';
  const title = document.createElement('h2');
  title.textContent = `${pdfId} — Page ${pageNum}`;
  viewer.appendChild(title);

  // Prefer plain 'text' key when available
  if (data.text && data.text.trim && data.text.trim().length) {
    const pre = document.createElement('pre');
    pre.innerHTML = highlightText(data.text, currentSearch);
    viewer.appendChild(pre);
  } else if (data.text_blocks && data.text_blocks.length) {
    const container = document.createElement('div');
    container.className = 'tm-text-blocks';
    for (const b of data.text_blocks) {
      for (const s of b.spans) {
        const p = document.createElement('p');
        p.innerHTML = highlightText(s.text || '', currentSearch);
        container.appendChild(p);
      }
    }
    viewer.appendChild(container);
  } else if (data.ocr_text && data.ocr_text.trim && data.ocr_text.trim().length) {
    const pre = document.createElement('pre');
    pre.innerHTML = highlightText(data.ocr_text, currentSearch);
    viewer.appendChild(pre);
  }

  // Render images
  if (data.images && data.images.length) {
    const imagesDiv = document.createElement('div');
    imagesDiv.className = 'tm-page-images';
    for (const img of data.images) {
      const imgEl = document.createElement('img');
      imgEl.src = '/' + img.file.replace(/\\\\/g, '/');
      imgEl.style.maxWidth = '100%';
      imagesDiv.appendChild(imgEl);
    }
    viewer.appendChild(imagesDiv);
  }

  // Fallback full-page raster
  if (data.page_image) {
    const imgEl = document.createElement('img');
    imgEl.src = '/' + data.page_image.replace(/\\\\/g, '/');
    imgEl.style.maxWidth = '100%';
    imgEl.style.marginTop = '0.5rem';
    viewer.appendChild(imgEl);
  }

  const total = await metaPageCount(pdfId);
  updatePager(total);
}

async function metaPageCount(pdfId) {
  try {
    const m = await fetchJSON(`/api/pdf/${encodeURIComponent(pdfId)}/pages`);
    return m.page_count;
  } catch (e) {
    return 0;
  }
}

async function updatePager(total) {
  const pager = document.getElementById('tm-pager');
  pager.innerHTML = '';
  const prev = document.createElement('button');
  prev.textContent = 'Prev';
  prev.onclick = () => { if (currentPage>1) { currentPage--; renderPage(currentPdf,currentPage); } };
  const next = document.createElement('button');
  next.textContent = 'Next';
  next.onclick = async () => { if (currentPage<total) { currentPage++; renderPage(currentPdf,currentPage); } };
  pager.appendChild(prev);
  const label = document.createElement('span');
  label.textContent = ` Page ${currentPage} / ${total} `;
  pager.appendChild(label);
  pager.appendChild(next);
}

async function performSearch() {
  const input = document.getElementById('tm-search-input');
  currentSearch = (input.value || '').trim();
  caseSensitive = !!document.getElementById('tm-highlight-case').checked;
  const useServer = !!(document.getElementById('tm-search-server') && document.getElementById('tm-search-server').checked);

  if (useServer && currentSearch) {
    try {
      const resp = await fetch('/api/search?q=' + encodeURIComponent(currentSearch));
      if (!resp.ok) {
        console.error('Search failed', resp.status);
        return;
      }
      const results = await resp.json();
      let resultsDiv = document.getElementById('tm-search-results');
      if (!resultsDiv) {
        resultsDiv = document.createElement('div');
        resultsDiv.id = 'tm-search-results';
        const viewer = document.getElementById('tm-viewer');
        viewer.parentNode.insertBefore(resultsDiv, viewer.nextSibling);
      }
      resultsDiv.innerHTML = '<h3>Search results</h3>';
      for (const r of results) {
        const item = document.createElement('div');
        item.className = 'tm-search-item';
        const a = document.createElement('a');
        a.href = '#';
        a.textContent = `${r.id} — page ${r.page}`;
        a.onclick = (e) => { e.preventDefault(); openPdf(r.id); currentPage = r.page; renderPage(r.id, r.page); };
        item.appendChild(a);
        const snip = document.createElement('div');
        snip.innerHTML = r.snippet || '';
        item.appendChild(snip);
        resultsDiv.appendChild(item);
      }
    } catch (e) {
      console.error(e);
    }
  } else {
    if (currentPdf) {
      renderPage(currentPdf, currentPage).catch(console.error);
    }
  }
}

window.addEventListener('load', () => {
  listPdfs().catch(console.error);
  const btn = document.getElementById('tm-search-btn');
  const input = document.getElementById('tm-search-input');
  const rebuildBtn = document.getElementById('tm-rebuild-index');
  if (btn) btn.onclick = performSearch;
  if (input) input.addEventListener('keypress', (e)=>{ if(e.key==='Enter') performSearch(); });
  if (rebuildBtn) {
    rebuildBtn.onclick = async () => {
      rebuildBtn.disabled = true;
      try {
        const resp = await fetch('/api/index/build', {method: 'POST'});
        if (resp.ok) {
          alert('Index build started');
        } else {
          alert('Index build request failed: ' + resp.status);
        }
      } catch (e) {
        console.error(e);
        alert('Index build error');
      }
      rebuildBtn.disabled = false;
    };
  }
});
