const express = require("express");
const app = express();
const cors = require("cors");
const multer = require("multer");
const path = require("path");
const port = 4000 || env.port;
app.use(cors());
const storage = multer.diskStorage({
	destination: (req, file, cb) => {
		cb(null, "upload_images/");
	},
	filename: (req, file, cb) => {
		cb(
			null,
			file.fieldname + "-" + Date.now() + path.extname(file.originalname)
		);
	},
});

app.get("/", async (req, res) => {
	res.send("server is running");
});

const upload = multer({ storage: storage }).array("file", 5);

app.post("/upload", (req, res) => {
	upload(req, res, (err) => {
		if (err) {
			res.send(err);
		} else {
			res.send("Files uploaded successfully");
		}
	});
});

app.listen(port, () => {
	console.log(`Server listening on port ${port}`);
});
