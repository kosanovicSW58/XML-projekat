<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:a1="http://www.ftn.uns.ac.rs/jaxb/a1"
                version="2.0">

    <xsl:template match="/">
        <html>
            <head>
                <meta charset="UTF-8"/>
                <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>Document</title>
                <style>
                    table {
                    font-family: arial, sans-serif;
                    border-collapse: collapse;
                    width: 100%;
                    margin-bottom: 50px;
                    }

                    td, th {
                    padding: 8px;
                    font-size: 15px;
                    text-align: center;
                    }
                    td{
                    background-color: #808080;
                    border: 1px solid black;
                    }
                    th{
                    border: 1px solid #dddddd;
                    }

                </style>
            </head>
            <body>
                <h1 style="text-align:center;">Zahtev za unosenje u evidenciju i deponovanje autorskih dela </h1>

                <div style="text-align: center;margin-top:15px;">
                    <inline><xsl:value-of select="//a1:Informacija_o_ustanovi/a1:Naziv"/></inline>
                    ,
                    <inline><xsl:value-of select="//a1:Informacija_o_ustanovi/a1:Adresa/a1:Ulica"/></inline>
                    <inline><xsl:value-of select="//a1:Informacija_o_ustanovi/a1:Adresa/a1:Broj"/></inline>
                    ,
                    <inline><xsl:value-of select="//a1:Informacija_o_ustanovi/a1:Adresa/a1:Postanski_broj"/></inline>
                    <inline><xsl:value-of select="//a1:Informacija_o_ustanovi/a1:Adresa/a1:Grad"/></inline>
                    ,
                    <inline><xsl:value-of select="//a1:Informacija_o_ustanovi/a1:Adresa/a1:Drzava"/></inline>
                </div>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:5px ;">Podnosilac prijave </h3>
                    <tr>
                        <th>Ime i Prezime</th>
                        <th>Adresa</th>
                        <th>Telefon</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Poslovno_ime">
                                    <xsl:value-of select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Poslovno_ime"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <div>
                                        <xsl:value-of select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Ime"/>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Prezime"/>
                                    </div>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:value-of select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Adresa/a1:Ulica"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Adresa/a1:Broj"/>
                            <xsl:value-of select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Adresa/a1:Postanski_broj"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Adresa/a1:Grad"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Adresa/a1:Drzava"/>
                        </td>
                        <td>
                            <xsl:value-of select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Kontakt/a1:Telefon"/>
                        </td>
                    </tr>
                </table>
                <table style="margin-top:-50px;">
                    <tr>
                        <th style="width:33%;">Email</th>
                        <th style="width:33%;">Faks</th>
                        <th style="width:34%;">Sediste</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Kontakt/a1:E_posta"/>
                        </td>
                        <td>
                            <xsl:value-of select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Kontakt/a1:Faks"/>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Sediste">
                                    <xsl:value-of select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:sediste"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <div>
                                        X
                                    </div>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                    </tr>
                </table>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:5px ;">Autori</h3>
                    <div>
                        <tr>
                            <th style="width:33%;">Ime i Prezime</th>
                            <th style="width:33%;">Adresa</th>
                            <th style="width:33%;">Drzavljanstvo</th>
                        </tr>
                        <xsl:for-each select="//a1:Popunjava_podnosilac/a1:Autori/*">
                            <xsl:choose>
                                <xsl:when test="a1:Autor">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="a1:Ime"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="a1:Prezime"/>
                                        </td>

                                        <td>
                                            <xsl:value-of select="a1:Adresa/a1:Ulica"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="a1:Adresa/a1:Broj"/>
                                            <xsl:value-of select="a1:Adresa/a1:Postanski_broj"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="a1:Adresa/a1:Grad"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="a1:Adresa/a1:Drzava"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="a1:Drzavljanstvo"/>
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr class="border">
                                        <td>
                                            <div>
                                                Anonimous
                                            </div>
                                        </td>
                                        <td>X</td>
                                        <td>X</td>
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </div>
                </table>
                <table style="margin-top:-50px;">
                    <div>
                        <tr>
                            <th style="width:25%;">Telefon</th>
                            <th style="width:25%;">Email</th>
                            <th style="width:25%;">Faks</th>
                            <th style="width:25%;">Godina smrti</th>
                        </tr>
                        <xsl:for-each select="//a1:Popunjava_podnosilac/a1:Autori/*">
                            <xsl:choose>
                                <xsl:when test="a1:Autor">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="a1:Kontakt/a1:Telefon"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="a1:Kontakt/a1:E_posta"/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="a1:Kontakt/a1:Faks"/>
                                        </td>
                                        <td>
                                            <xsl:choose>
                                                <xsl:when test="a1:Godina_smrti">
                                                    <xsl:value-of select="a1:Godina_smrti"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    X
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr class="border">
                                        <td>X</td>
                                        <td>X</td>
                                        <td>X</td>
                                        <td>X</td>
                                    </tr>

                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                    </div>
                </table>

                <table >
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:10px ;">Autorsko Delo</h3>
                    <tr>
                        <th>Naslov dela</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="//a1:AutorskoDelo/a1:Naslov"/>
                        </td>
                    </tr>
                </table>
                <table style="margin-top:-50px;">
                    <tr>
                        <th>Vrsta dela</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="//a1:AutorskoDelo/a1:Vrsta"/>
                        </td>
                    </tr>
                </table>
                <table style="margin-top:-50px;">
                    <tr>
                        <th>Forma dela</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="//a1:AutorskoDelo/a1:Forma"/>
                        </td>
                    </tr>
                </table>
                <table style="margin-top:-50px;">
                    <xsl:if test="//a1:AutorskoDelo/a1:Podaci_o_naslovu_autorskog_dela">
                        <tr>
                            <th>
                                Podaci o autorskom delu
                            </th>
                        </tr>
                        <tr>
                            <td>
                                <xsl:value-of select="//a1:AutorskoDelo/a1:Podaci_o_naslovu_autorskog_dela/a1:Naslov_autorskog_dela"/>
                                <xsl:text> - </xsl:text>
                                <xsl:value-of select="//a1:AutorskoDelo/a1:Podaci_o_naslovu_autorskog_dela/a1:Ime_autora"/>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="//a1:AutorskoDelo/a1:Stvoreno_u_radnom_odnosu">
                            <tr>
                                <td>
                                    Stvoreno u radnom odnosu
                                </td>
                            </tr>
                        </xsl:when>
                        <xsl:otherwise>
                            <tr>
                                <td>
                                    Nije stvoreno u radnom odnosu
                                </td>
                            </tr>
                        </xsl:otherwise>
                    </xsl:choose>
                </table>
                <table style="margin-top:-50px;">
                    <tr>
                        <th>Nacin koriscenja</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="//a1:AutorskoDelo/a1:Nacin_koriscenja"/>
                        </td>
                    </tr>
                </table>
                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:5px ;">Popunjava zavod</h3>
                    <tr>
                        <th>Prilozi uz zahtev</th>
                    </tr>
                    <xsl:if test="//a1:Popunjava_zavod/a1:Prilozi_uz_zahtev/a1:Opis_autorskog_dela">
                        <xsl:for-each select="//a1:Popunjava_zavod/a1:Prilozi_uz_zahtev/a1:Opis_autorskog_dela/*">
                            <tr>
                                <td class="border cell-2">
                                    <xsl:variable name="name" select="name(.)"/>
                                    <xsl:value-of select="concat(translate($name, '_', ' '), ' ')"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </xsl:if>
                </table>
                <table style="margin-top: 110px;">
                    <tr>
                        <th style="background-color: #FFF; border: 0px; width: 50%">Broj prijave</th>
                        <th style="background-color: #FFF; border: 0px; width: 50%">Datum podnosenja</th>
                    </tr>
                    <tr>
                        <td style="background-color: #FFF; border: 0px; width: 50%">              
                            <xsl:value-of select="//a1:Popunjava_zavod/a1:Broj_prijave"/>
                        </td>
                        <td style="background-color: #FFF; border: 0px; width: 50%">
                            <xsl:value-of select="//a1:Popunjava_zavod/a1:Datum_podnosenja"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
