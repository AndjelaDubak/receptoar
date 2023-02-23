/*Autori: Andjela Dubak 18/0658, Aleksandar Dopudja 18/0118*/ 

function start(){
    fja();
}

function removeParent(element) {
	var r = window.confirm("Da li ste sigurni?");
	if (r == true) {
		element.parentNode.remove();
	} else {
		
	}
}

function fja(){
    var path = window.location.pathname;
    var page = path.split("/").pop();

	if (!page.localeCompare("administrator.html") || !page.localeCompare("administrator_noc.html") || !page.localeCompare("moderator.html") || !page.localeCompare("moderator_noc.html") || !page.localeCompare("glavna.html") || !page.localeCompare("glavna_noc.html") || !page.localeCompare("recept.html") || !page.localeCompare("recept_noc.html") || !page.localeCompare("postavljanje_recepta.html") || !page.localeCompare("postavljanje_recepta_noc.html")){
		if(!page.localeCompare("recept.html")) {
			document.getElementById("rezim").src = "img/noc.png";
		}
		if(!page.localeCompare("recept_noc.html")) {
			document.getElementById("rezimN").src = "img/dan.png";
		}
		if(!page.localeCompare("postavljanje_recepta.html")) {
			document.getElementById("rezim").src = "img/noc.png";
		}
		if(!page.localeCompare("postavljanje_recepta_noc.html")) {
			document.getElementById("rezimN").src = "img/dan.png";
		}
		document.getElementById("sifra").innerHTML = "&nbsp;Promena lozinke&nbsp;";
		document.getElementById("pravila").innerHTML = "&nbsp;Pravila takmičenja&nbsp;";
		document.getElementById("postavljanje").innerHTML = "&nbsp;Postavljanje recepta&nbsp;";
		document.getElementById("hronoloski").innerHTML = "&nbsp;Sortiraj hronološki&nbsp;";
		document.getElementById("glasovi").innerHTML = "&nbsp;Sortiraj po broju glasova&nbsp;";
		document.getElementById("pobednici").innerHTML = "&nbsp;Pobednički recepti&nbsp;";
		if (!page.localeCompare("administrator.html") || !page.localeCompare("administrator_noc.html") || !page.localeCompare("moderator.html") || !page.localeCompare("moderator_noc.html"))
			document.getElementById("kori").innerHTML = "&nbsp;Spisak korisnika&nbsp;";
		if (!page.localeCompare("administrator.html") || !page.localeCompare("administrator_noc.html"))
			document.getElementById("moder").innerHTML = "&nbsp;Spisak moderatora&nbsp;";
		document.getElementById("odjava").innerHTML = "&nbsp;Odjava&nbsp;";
		if (!page.localeCompare("administrator.html") || !page.localeCompare("moderator.html") || !page.localeCompare("glavna.html"))
			document.getElementById("rezim").src = "img/noc.png";
		else
			document.getElementById("rezimN").src="img/dan.png"
		document.getElementById("tema").innerHTML = "&nbsp;PIZZA&nbsp;";
	}
	else if (!page.localeCompare("administrator_spisak_korisnika.html") || !page.localeCompare("administrator_spisak_korisnika_noc.html") || !page.localeCompare("administrator_spisak_moderatora.html") || !page.localeCompare("administrator_spisak_moderatora_noc.html") || !page.localeCompare("moderator_spisak_korisnika.html") || !page.localeCompare("moderator_spisak_korisnika_noc.html") || !page.localeCompare("recept.html")){
		document.getElementById("sifra").innerHTML = "&nbsp;Promena lozinke&nbsp;";
		document.getElementById("pravila").innerHTML = "&nbsp;Pravila takmičenja&nbsp;";
		document.getElementById("postavljanje").innerHTML = "&nbsp;Postavljanje recepta&nbsp;";
		document.getElementById("hronoloski").innerHTML = "&nbsp;Sortiraj hronološki&nbsp;";
		document.getElementById("glasovi").innerHTML = "&nbsp;Sortiraj po broju glasova&nbsp;";
		document.getElementById("pobednici").innerHTML = "&nbsp;Pobednički recepti&nbsp;";
		document.getElementById("kori").innerHTML = "&nbsp;Spisak korisnika&nbsp;";
		if (!page.localeCompare("administrator_spisak_korisnika.html") || !page.localeCompare("administrator_spisak_korisnika_noc.html") || !page.localeCompare("administrator_spisak_moderatora.html") || !page.localeCompare("administrator_spisak_moderatora_noc.html"))
			document.getElementById("moder").innerHTML = "&nbsp;Spisak moderatora&nbsp;";
		document.getElementById("odjava").innerHTML = "&nbsp;Odjava&nbsp;";
		if (!page.localeCompare("administrator_spisak_korisnika.html")  || !page.localeCompare("administrator_spisak_moderatora.html") || !page.localeCompare("moderator_spisak_korisnika.html"))
			document.getElementById("rezim").src = "img/noc.png";
		else
			document.getElementById("rezimN").src = "img/dan.png";
		document.getElementById("kor_ime").innerHTML = "&nbsp;Korisničko ime&nbsp;";	
	}
	else if (!page.localeCompare("komentari.html") || !page.localeCompare("brisanjeKom.html")){	
		document.getElementById("naslov").innerHTML = "Komentari";
		document.getElementById("komentar").innerHTML = "Prvi komentar";
		document.getElementById("komentar1").innerHTML = "Drugi komentar";
		document.getElementById("unosKom").innerHTML = "Unesite Vaš komentar:&nbsp&nbsp;";
		
		var inp = document.createElement("textarea");
		inp.setAttribute("id", "kom");
		inp.setAttribute("name", "komentar");
		inp.setAttribute("cols", "80");
		inp.setAttribute("rows", "2");
		document.getElementById("write-comment").appendChild(inp);
		
		var dugm = document.createElement("input");
		dugm.setAttribute("type", "submit");
		dugm.setAttribute("id", "dugme");
		dugm.setAttribute("name", "potvrda");
		dugm.setAttribute("value", "Pošalji");
		document.getElementById("write-comment").appendChild(dugm);
	}
    else if (!page.localeCompare("lozinka.html")){
		document.getElementById("pl").innerHTML = "Promena lozinke";
				
		var star = document.createElement("input");
		star.setAttribute("type", "password");
		star.setAttribute("minlength", "8");
		star.setAttribute("id", "login-password");
		star.setAttribute("class", "input");
		star.setAttribute("title", "Molimo Vas, popunite ovo polje.");
		star.setAttribute("name", "oldpassword");
		star.setAttribute("oninvalid", "this.setCustomValidity('Morate popuniti ovo polje!')");
		star.setAttribute("required", "");
		star.setAttribute("oninput", "this.setCustomValidity('')");
		star.setAttribute("placeholder", "Stara lozinka");
		document.getElementById("StaraSif").appendChild(star);
		
		var nova = document.createElement("input");
		nova.setAttribute("type", "password");
		nova.setAttribute("minlength", "8");
		nova.setAttribute("id", "login-password");
		nova.setAttribute("class", "input");
		nova.setAttribute("title", "Molimo Vas, popunite ovo polje.");
		nova.setAttribute("name", "newpassword");
		nova.setAttribute("oninvalid", "this.setCustomValidity('Morate popuniti ovo polje!')");
		nova.setAttribute("required", "");
		nova.setAttribute("oninput", "this.setCustomValidity('')");
		nova.setAttribute("placeholder", "Nova lozinka");
		document.getElementById("NovaSif").appendChild(nova);
		
		var dug = document.createElement("input");
		dug.setAttribute("type", "submit");
		dug.setAttribute("name", "login");
		dug.setAttribute("value", "Promeni lozinku");
		dug.setAttribute("class", "button");
		document.getElementById("for").appendChild(dug);
	}
    else if (!page.localeCompare("prijavljivanje.html")){
		document.getElementById("pr").innerHTML = "Prijava";
		
		var ime = document.createElement("input");
		ime.setAttribute("type", "text");
		ime.setAttribute("class", "input");
		ime.setAttribute("title", "Molimo Vas, popunite ovo polje.");
		ime.setAttribute("name", "username");
		ime.setAttribute("oninvalid", "this.setCustomValidity('Morate popuniti ovo polje!')");
		ime.setAttribute("required", "");
		ime.setAttribute("oninput", "this.setCustomValidity('')");
		ime.setAttribute("placeholder", "Korisničko ime");
		document.getElementById("ime").appendChild(ime);

		var sif = document.createElement("input");
		sif.setAttribute("type", "password");
		sif.setAttribute("minlength", "8");
		sif.setAttribute("id", "login-password");
		sif.setAttribute("class", "input");
		sif.setAttribute("title", "Molimo Vas, popunite ovo polje.");
		sif.setAttribute("name", "password");
		sif.setAttribute("oninvalid", "this.setCustomValidity('Morate popuniti ovo polje!')");
		sif.setAttribute("required", "");
		sif.setAttribute("oninput", "this.setCustomValidity('')");
		sif.setAttribute("placeholder", "Lozinka");
		document.getElementById("sifra").appendChild(sif);	

		var dug = document.createElement("input");
		dug.setAttribute("type", "submit");
		dug.setAttribute("name", "login");
		dug.setAttribute("value", "Prijavi se");
		dug.setAttribute("class", "button");
		document.getElementById("forma").appendChild(dug);
	}
    else if (!page.localeCompare("registracija.html")){
		document.getElementById("pr").innerHTML = "Registracija";
		
		var ime = document.createElement("input");
		ime.setAttribute("type", "text");
		ime.setAttribute("class", "input");
		ime.setAttribute("title", "Molimo Vas, popunite ovo polje.");
		ime.setAttribute("name", "name");
		ime.setAttribute("oninvalid", "this.setCustomValidity('Morate popuniti ovo polje!')");
		ime.setAttribute("required", "");
		ime.setAttribute("oninput", "this.setCustomValidity('')");
		ime.setAttribute("placeholder", "Ime");
		document.getElementById("ime").appendChild(ime);
		
		var prezime = document.createElement("input");
		prezime.setAttribute("type", "text");
		prezime.setAttribute("class", "input");
		prezime.setAttribute("title", "Molimo Vas, popunite ovo polje.");
		prezime.setAttribute("name", "surname");
		prezime.setAttribute("oninvalid", "this.setCustomValidity('Morate popuniti ovo polje!')");
		prezime.setAttribute("required", "");
		prezime.setAttribute("oninput", "this.setCustomValidity('')");
		prezime.setAttribute("placeholder", "Prezime");
		document.getElementById("prezime").appendChild(prezime);
		
		var email = document.createElement("input");
		email.setAttribute("type", "email");
		email.setAttribute("class", "input");
		email.setAttribute("title", "Molimo Vas, popunite ovo polje.");
		email.setAttribute("name", "email");
		email.setAttribute("oninvalid", "this.setCustomValidity('Morate popuniti ovo polje!')");
		email.setAttribute("required", "");
		email.setAttribute("oninput", "this.setCustomValidity('')");
		email.setAttribute("placeholder", "Email");
		document.getElementById("email").appendChild(email);
		
		var kor_ime = document.createElement("input");
		kor_ime.setAttribute("type", "text");
		kor_ime.setAttribute("class", "input");
		kor_ime.setAttribute("title", "Molimo Vas, popunite ovo polje.");
		kor_ime.setAttribute("name", "username");
		kor_ime.setAttribute("oninvalid", "this.setCustomValidity('Morate popuniti ovo polje!')");
		kor_ime.setAttribute("required", "");
		kor_ime.setAttribute("oninput", "this.setCustomValidity('')");
		kor_ime.setAttribute("placeholder", "Korisničko ime");
		document.getElementById("kor_ime").appendChild(kor_ime);
		
		var sif = document.createElement("input");
		sif.setAttribute("type", "password");
		sif.setAttribute("minlength", "8");
		sif.setAttribute("id", "login-password");
		sif.setAttribute("class", "input");
		sif.setAttribute("title", "Molimo Vas, popunite ovo polje.");
		sif.setAttribute("name", "password");
		sif.setAttribute("oninvalid", "this.setCustomValidity('Morate popuniti ovo polje!')");
		sif.setAttribute("required", "");
		sif.setAttribute("oninput", "this.setCustomValidity('')");
		sif.setAttribute("placeholder", "Lozinka");
		document.getElementById("sifra").appendChild(sif);
		
		var sif1 = document.createElement("input");
		sif1.setAttribute("type", "password");
		sif1.setAttribute("minlength", "8");
		sif1.setAttribute("id", "login-password");
		sif1.setAttribute("class", "input");
		sif1.setAttribute("title", "Molimo Vas, popunite ovo polje.");
		sif1.setAttribute("name", "password");
		sif1.setAttribute("oninvalid", "this.setCustomValidity('Morate popuniti ovo polje!')");
		sif1.setAttribute("required", "");
		sif1.setAttribute("oninput", "this.setCustomValidity('')");
		sif1.setAttribute("placeholder", "Potvrda lozinke");
		document.getElementById("potvrdaSifre").appendChild(sif1);	


		var dug = document.createElement("input");
		dug.setAttribute("type", "submit");
		dug.setAttribute("name", "login");
		dug.setAttribute("value", "Registruj se");
		dug.setAttribute("class", "button");
		document.getElementById("forma").appendChild(dug);
	}
}