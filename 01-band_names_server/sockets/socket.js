const { io } = require("../index");
const Bands = require("../models/bands");
const Band = require("../models/band");

const bands = new Bands();

bands.addBand(new Band("Queen"));
bands.addBand(new Band("Bon Jovi"));
bands.addBand(new Band("Metallica"));

// Mensajes de Sockets
io.on("connection", client => {
	console.log("Cliente Conectado");

	client.emit("active-bands", bands.getBands());
	const showBands = () => client.emit("active-bands", bands.getBands());

	client.on("disconnect", () => {
		console.log("Clente desconectado");
	});

	client.on("mensaje", payload => {
		console.log(payload);

		io.emit("mensaje", { admin: "Nuevo mensaje" });
	});

	client.on("add-band", payload => {
		bands.addBand(new Band(payload.name));

		showBands();
	});

	client.on("vote-band", payload => {
		bands.voteBand(payload.id);
		showBands();
	});

	client.on("delete-band", payload => {
		bands.deleteBand(payload.id);
		showBands();
	});

	client.on("emitir-mensaje", payload => {
		client.broadcast.emit("nuevo-mensaje", payload);
	});
});