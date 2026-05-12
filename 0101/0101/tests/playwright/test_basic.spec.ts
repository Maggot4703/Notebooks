import { test, expect } from '@playwright/test';

test.describe('0101 basic app', () => {
  test('homepage loads and responds to ping', async ({ page }) => {
    await page.goto('http://localhost:8080/index.html');
    await expect(page).toHaveTitle(/0101|Index/i);
    // send a ping request to keep the server alive
    const resp = await page.request.get('/api/ping');
    expect(resp.status()).toBe(204);
  });
});
