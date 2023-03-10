const { io } = require("../index");

// Mensajes de Sockets
io.on("connection", client => {
	console.log("Cliente Conectado");

	client.on("disconnect", () => {
		console.log("Clente desconectado");
	});

	client.on("mensaje", payload => {
		console.log(payload);

		io.emit("mensaje", { admin: "Nuevo mensaje" });
	});
});