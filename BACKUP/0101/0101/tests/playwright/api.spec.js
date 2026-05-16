const { test, expect } = require('@playwright/test');

// Validate POST /api/text/:key and GET /api/text/:key roundtrip
test('save and retrieve text via /api/text/:key', async ({ request }) => {
  const key = 'playwright-test-key';
  const text = 'hello-playwright-' + Date.now();

  const postRes = await request.post(`/api/text/${key}`, { data: text });
  expect(postRes.status()).toBeGreaterThanOrEqual(200);
  expect(postRes.status()).toBeLessThan(300);

  const getRes = await request.get(`/api/text/${key}`);
  expect(getRes.status()).toBe(200);
  const body = await getRes.text();
  expect(body).toBe(text);
});
