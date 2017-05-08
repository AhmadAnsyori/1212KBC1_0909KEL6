/*====================================================================================
           SISTEM PAKAR TENTANG DIAGNOSA PENYAKIT PADA PARU-PARU MANUSIA
				KELOMPOK 6
		          Artificial Intelligence
=====================================================================================*/

domains
            kerusakan = symbol
            gejala = symbol
            tanya = string
            jawab = char
            list = string*
            nama = orang(symbol,symbol)
database
            xcari(gejala)
            xgagal(gejala)
predicates
            mulai
            cari(tanya,gejala)
            gagal(tanya,gejala)
  nondeterm gejala(gejala)
            clear_fakta2
            simpan(gejala,jawab)
            tanya(tanya,gejala,jawab)
            go_once
  nondeterm diagnosa(kerusakan)
            solusi(kerusakan)
            penanganan(kerusakan)
  nondeterm printlist(list)
 nondeterm input_nama 
 nondeterm cetak_orang(nama)          
       
goal
write("KELOMPOK 6"),nl,
	printlist([
	    
            "\t1. MUHAMMAD HARDI\t\t1515015103\n",
            "\t2. AHMAD ANSYORI\t\t1515015106\n",
            "\t3. ERWIN RIZKIAWAN\t\t1515015107\n",
            "\t4. ISRO RAJAB\t\t\t1515015118\n"]),
	write("--------------SELAMAT DATANG DI KLINIK-------------"),nl,
	write("-------------PEMERIKSAAN PENYAKIT PARU-PARU--------------"),nl,nl,
	write("SILAHKAN ISI DIAGNOSA DIBAWAH DENGAN KONDISI Y (benar) & T (untuk tidak)"),nl,nl,
	input_nama,
        mulai.
clauses
input_nama:-
write("\nMasukkan Nama Depan : "),readln(Ndepan),
write("\nMasukkan Nama Belakang : "),readln(NBelakang),
write("\nSelamat Datang "),
cetak_orang(orang(Ndepan,Nbelakang)),
write(" DI SISTEM PAKAR PARU - PARU\n").

cetak_orang(orang(Pertama,Kedua)):-
write(Pertama," ",Kedua).
% cetak list %
            printlist([]).
            printlist([H|T]):-
            write(H," "),nl,
            printlist(T).
            mulai:-
                        go_once,nl,nl,nl,nl,nl,
                        write("Apakah Ingin mengulang lagi (Y/T) ?"),
                        readchar(Jawab),nl,
                        Jawab = 'y',
                        mulai.%rekursi memanggil dirinya sendiri%
            go_once:-
                        diagnosa(_),!,write("Save"),
                        save("test.dat"),
                        clear_fakta2.
            go_once:-
                        write("MAAF SAYA TIDAK MENEMUKAN PENYAKIT YANG ADA PADA PARU-PARU ANDA"),nl,
                        clear_fakta2.
            cari(_,Gejala):-write("Apakah "),
                        xcari(Gejala),!.
            cari(Tanya,Gejala):-write("Anda Mengalami "),
                        not(xgagal(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab='y'.
                        
            gagal(_,Gejala):-
                        xgagal(Gejala),!.
            gagal(Tanya,Gejala):-
                        not(xcari(Gejala)),
                        tanya(Tanya,Gejala,Jawab),
                        Jawab='t'.
                        
            tanya(Tanya,Gejala,Jawab):-
                        write(Tanya),
                        readchar(Jawab),
                        write(Jawab),nl,
                        simpan(Gejala,Jawab).
            simpan(Gejala,'y'):-
                        asserta(xcari(Gejala)).
            simpan(Gejala,'t'):-
                        asserta(xgagal(Gejala)).
            simpan(Gejala,'Y'):-
                        asserta(xcari(Gejala)).
            simpan(Gejala,'T'):-
                        asserta(xgagal(Gejala)).
            clear_fakta2:-
                        retract(xcari(_)),fail.
            clear_fakta2:-
                        retract(xgagal(_)),fail.
            clear_fakta2.

/*-------------------------------------------------------------G E J A L A-------------------------------------------------------------*/

            gejala(Gejala):-
                        xcari(Gejala),!.
            gejala(Gejala):-
                        xgagal(Gejala),!,fail.

            gejala(bronkitis):-
            		write("======================================"),nl,
            		write("Pertanyaan Penyakit Bronkitis"),nl,
            		write("======================================"),nl,
                        cari(" Batuk-batuk disertai lendir berwarna kuning keabu-abuan atau hijau(y/t)? ",bronkitis),
                        cari(" Sakit pada tenggorokan(y/t)? ",bronkitis1),
                        cari(" Sesak napas(y/t)? ",bronkitis2),
                        cari(" Hidung beringus atau tersumbat(y/t)? ",bronkitis3),
                        cari(" Sakit atau rasa tidak nyaman pada dada(y/t)? ",bronkitis4),
                        cari(" Kelelahan(y/t)? ",bronkitis5),
                        cari(" Demam Ringan(y/t)? ",bronkitis6).
            gejala(emfisema):-
            		write("======================================"),nl,
            		write("Pertanyaan Penyakit Emfisema"),nl,
            		write("======================================"),nl,
                        cari(" Sesak Napas (y/t)? ",emfisema),
                        cari(" Batuk Kronis (y/t)? ",emfisema1),
                        cari(" Sering Merasa Gelisah (y/t)? ",emfisema2),
                        cari(" Penurunan Berat Badan (y/t)? ",emfisema3),
                        cari(" Sering Merasa Kelelahan (y/t)? ",emfisema4),
                        cari(" Pembengkakan Pada Mata Kaki dan Kaki (y/t)? ",emfisema5),
                        cari(" Penurunan Kemampuan untuk Berolahraga (y/t)? ",emfisema6).
                            
	     gejala(pleuritis):-
	     		write("======================================"),nl,
            		write("Pertanyaan Penyakit Pleuritis"),nl,
            		write("======================================"),nl,
                        cari(" Sakit Pada Dada (y/t)? ",pleuritis),
                        cari(" Sakit pada bahu (y/t)? ",pleuritis1),
             		cari(" Batuk kering (y/t)? ",pleuritis2),
            		cari(" Sesak napas (y/t)? ",pleuritis3),
            		cari(" Demam (y/t)? ",pleuritis4),
            		cari(" Berkeringat (y/t)? ",pleuritis5),
            		cari(" Mual (y/t)? ",pleuritis6).
            		
             gejala(pneumonia):-
             		write("======================================"),nl,
            		write("Pertanyaan Penyakit Pneumonia"),nl,
            		write("======================================"),nl,
                        cari(" Demam,Berkeringat dan menggigil(y/t)? ",pneumonia),
                        cari(" Batuk Berdahak (y/t)? ",pneumonia1),
                        cari(" Nyeri Dada Saat Batuk (y/t)? ",pneumonia2),
                        cari(" Sesak Nafas (y/t)? ",pneumonia3),
                        cari(" Mual, Muntah atau Diare (y/t)? ",pneumonia4),
                        cari(" Sakit Kepala (y/t)? ",pneumonia5).
                        
/* -----------------------------------------------------------D I A G N O S A-------------------------------------------------------- */

            diagnosa("Penyakit_bronkitis"):-
                        gejala(bronkitis),
                        gejala(bronkitis1),
                        gejala(bronkitis2),
                        gejala(bronkitis3),
                        gejala(bronkitis4),
                        gejala(bronkitis5),
                        gejala(bronkitis6),
                        solusi("Penyakit Bronkitis"),
            penanganan("\tAntimikroba\n\t\t\tAntitusiv dan Ekspektoran\n\t\t\tBronkodilator Kortikosteroid sistemik\n\t\t\tKortikosteroid inhalasi\n\t\t\tAnti virus (Zanamivir, Rimantadine, Oseltamivir dan Peramivir)\n\t\t\tAnalgesik antipiretik (Ibuprofen, Acetaminophen)\n\t\t\t").
          
            
            diagnosa("Penyakit_emfisema"):-
                        gejala(emfisema),
                        gejala(emfisema1),
                        gejala(emfisema2),
                        gejala(emfisema3),
                        gejala(emfisema4),
                        gejala(emfisema5),
                        gejala(emfisema6),
                        solusi("Penyakit Emfisema"),
            penanganan("Berhenti merokok adalah pengobatan yang paling penting dan efektif untuk menangani gejala penyakit emfisema.").
            
            
            
	    diagnosa("Penyakit_pleuritis"):-
                        gejala(pleuritis),
       			gejala(pleuritis1),
       			gejala(pleuritis2),
       			gejala(pleuritis3),
       			gejala(pleuritis4),
       			gejala(pleuritis5),
       			gejala(pleuritis6),
                        solusi("Penyakit Pleuritis"),
            penanganan("antiinflamasi nonsteroid").
            
            
            
            diagnosa("Penyakit_pneumonia"):-
                        gejala(pneumonia),
                        gejala(pneumonia1),
                        gejala(pneumonia2),
                        gejala(pneumonia3),
                        gejala(pneumonia4),
                        gejala(pneumonia5),
                    	solusi("Penyakit Pneumonia"),
            penanganan("\tAntibiotik\n\t\t\tVaksin Influenza").
            
/*==================================================================================================================================*/           
            
            solusi(Kerusakan):-
                        upper_lower(XKerusakan,Kerusakan),nl,nl,nl,
                        write("  # Gejala yang ada pada anda adalah = ",XKerusakan),nl.  
                        
            penanganan(Kerusakan):-
                        upper_lower(BKerusakan,Kerusakan),nl,nl,nl,
                        write("  # Solusinya adalah = ",BKerusakan),nl.  