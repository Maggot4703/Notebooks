const { test, expect } = require('@playwright/test');

// Basic page load and content check
test('root serves index and includes persist script', async ({ page }) => {
  const response = await page.goto('/');
  expect(response.status()).toBeLessThan(400);
  await expect(page).toHaveURL(/localhost:8080/);

  const content = await page.content();
  expect(content).toContain('persist.js');
});
