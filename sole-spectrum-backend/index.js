const app = require('./server');

if (require.main === module) {
	const PORT = process.env.PORT || 5000;
	app.listen(PORT, () => {
		console.log(`✅ Sole Spectrum backend running on http://localhost:${PORT}`);
	});
} else {
	module.exports = app;
}
