try {
  console.log(require.resolve('@playwright/test'));
} catch (e) {
  console.error('resolve failed', e.message);
  process.exit(0);
}
