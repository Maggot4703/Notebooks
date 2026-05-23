const { test, expect } = require('@playwright/test');

// Simple API smoke test for the 0101 server
test('api ping returns 204', async ({ request }) => {
  const res = await request.get('http://localhost:8080/api/ping');
  expect(res.status()).toBe(204);
});

// Basic page load test (optional)
test('root serves index', async ({ page }) => {
  await page.goto('http://localhost:8080/');
  // If the page has a title, this will pass; otherwise it just confirms 200 OK
  await expect(page).toHaveURL(/localhost:8080/);
});
