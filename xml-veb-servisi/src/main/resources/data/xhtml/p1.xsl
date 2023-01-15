<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:p1="http://www.ftn.uns.ac.rs/jaxb/p1"
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
                <h1 style="text-align:center;">Zahtev za priznavanje patenta</h1>

                <div style="text-align: center;margin-top:15px;">
                    <inline>
                        <xsl:value-of select="//p1:Informacije_o_ustanovi/p1:Naziv"/>,
                    </inline>
                    <inline>
                        <xsl:value-of select="//p1:Informacije_o_ustanovi/p1:Adresa/p1:Ulica"/>
                    </inline>
                    <inline>
                        <xsl:value-of select="//p1:Informacije_o_ustanovi/p1:Adresa/p1:Broj"/>,
                    </inline>
                    <inline>
                        <xsl:value-of select="//p1:Informacije_o_ustanovi/p1:Adresa/p1:Postanski_broj"/>
                    </inline>
                    <inline>
                        <xsl:value-of select="//p1:Informacije_o_ustanovi/p1:Adresa/p1:Grad"/>
                    </inline>
                </div>

                <table style="margin-top: 30px;">
                    <tr>
                        <th style="width: 33%;">Broj prijave</th>
                        <th style="width: 33%;">Datum prijema</th>
                        <th style="width: 33%;">Priznati datum podnosenja</th>
                    </tr>
                    <xsl:for-each select="//p1:Popunjava_zavod">
                        <tr>
                            <td style="width: 33%;">
                                <xsl:value-of select="p1:Broj_prijave"/>
                            </td>
                            <td style="width: 33%;">
                                <xsl:value-of select="p1:Datum_prijema"/>
                            </td>
                            <td style="width: 34%;">
                                <xsl:value-of select="p1:Priznati_datum_podnosenja"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:5px ;">Naziv patenta</h3>
                    <tr>
                        <th>Na srpskom jeziku</th>
                        <th>Na engleskom jeziku</th>
                    </tr>
                    <xsl:for-each select="//p1:Naziv_patenta">
                        <tr>
                            <td>
                                <xsl:value-of select="p1:Naziv_na_srpskom"/>
                            </td>
                            <td>
                                <xsl:value-of select="p1:Naziv_na_engleskom"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:10px ;">Podnosilac prijave</h3>
                    <tr>
                        <th style="width:50%;">Ime i prezime</th>
                        <th style="width:50%;">Adresa</th>
                    </tr>
                    <xsl:for-each select="//p1:Popunjava_podnosioc/p1:Podaci_o_podnosiocu/p1:Podnosioc">
                        <tr>
                            <td style="width:50%;">
                                <xsl:choose>
                                    <xsl:when test="p1:Poslovno_ime">
                                        <xsl:value-of select="p1:Poslovno_ime"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div>
                                            <xsl:value-of select="p1:Ime"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="p1:Prezime"/>
                                        </div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td style="width:50%;">
                                <xsl:value-of select="p1:Adresa/p1:Ulica"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="p1:Adresa/p1:Broj"/>
                                <xsl:value-of select="p1:Adresa/p1:Postanski_broj"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="p1:Adresa/p1:Grad"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <table style="margin-top:-50px;">
                    <tr>
                        <th style="width:33%;">Telefon</th>
                        <th style="width:33%;">Email</th>
                        <th style="width:34%;">Faks</th>
                    </tr>
                    <xsl:for-each select="//p1:Popunjava_podnosioc/p1:Podaci_o_podnosiocu/p1:Podnosioc">
                        <tr>
                            <td  style="width:33%;">
                                <xsl:value-of select="p1:Kontakt/p1:Telefon"/>
                            </td>

                            <td  style="width:33%;">
                                <xsl:value-of select="p1:Kontakt/p1:E_posta"/>
                            </td>

                            <td  style="width:34%;">
                                <xsl:value-of select="p1:Kontakt/p1:Faks"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <table>
                    <tr>
                        <th>Pronalazac</th>
                    </tr>
                    <tr>
                        <td>Pronalazac ne zeli da bude naveden</td>
                    </tr>
                </table>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:10px ;">Punomocnik</h3>
                    <tr>
                        <th style="width:50%;">Ime i prezime</th>
                        <th style="width:50%;">Adresa</th>
                    </tr>
                    <xsl:for-each select="//p1:Popunjava_podnosioc/p1:Podaci_o_punomocniku/p1:Punomocnik">
                        <tr>
                            <td style="width:50%;">
                                    <xsl:choose>
                                        <xsl:when test="p1:Poslovno_ime">
                                            <xsl:value-of select="p1:Poslovno_ime"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <div>
                                                <xsl:value-of select="p1:Ime"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="p1:Prezime"/>
                                            </div>
                                        </xsl:otherwise>
                                    </xsl:choose>
                            </td>
                            <td style="width:50%;">
                                <xsl:value-of select="p1:Adresa/p1:Ulica"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="p1:Adresa/p1:Broj"/>
                                <xsl:value-of select="p1:Adresa/p1:Postanski_broj"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="p1:Adresa/p1:Grad"/>
                            </td>
                        </tr>
                    </xsl:for-each>

                </table>
                <table style="margin-top:-50px;">
                    <tr>
                        <th style="width:33%;">Telefon</th>
                        <th style="width:33%;">Email</th>
                        <th style="width:34%;">Faks</th>
                    </tr>
                    <xsl:for-each select="//p1:Popunjava_podnosioc/p1:Podaci_o_punomocniku/p1:Punomocnik">
                        <tr>
                            <td style="width:33%;">
                                <xsl:value-of select="p1:Kontakt/p1:Telefon"/>
                            </td>
                            <td style="width:33%;">
                                <xsl:value-of select="p1:Kontakt/p1:E_posta"/>
                            </td>
                            <td style="width:34%;">
                                <xsl:value-of select="p1:Kontakt/p1:Faks"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:10px ;">Adresa i nacin dostavljanja</h3>
                    <tr>
                        <th style="width: 50%;">Adresa</th>
                        <th style="width: 50%;">Nacin dostavljanja</th>
                    </tr>
                    <xsl:for-each select="//p1:Popunjava_podnosioc/p1:Dostavljanje">
                        <tr>
                            <td style="width: 50%;">
                                <xsl:value-of select="p1:Adresa/p1:Ulica"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="p1:Adresa/p1:Broj"/>
                                <xsl:value-of select="p1:Adresa/p1:Postanski_broj"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="p1:Adresa/p1:Grad"/>
                            </td>
                            <td style="width: 50%;">
                                <xsl:value-of select="p1:Nacin"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:10px ;">Prvobitna/Osnovna prijava</h3>
                    <tr>
                        <th style="width: 33%;">Broj prvobitne/osnovne prijave</th>
                        <th style="width: 33%;">Datum podnosenja prvobitne/osnovne prijave</th>
                        <th style="width: 33%;">Tip prijave</th>
                    </tr>
                    <tr>
                        <xsl:for-each select="//p1:Prvobitna_prijava">
                            <tr>
                                <td style="width: 33%;">
                                    <xsl:value-of select="p1:Broj_prijave"/>
                                </td>

                                <td style="width: 33%;">
                                    <xsl:value-of select="p1:Datum_podnosenja"/>
                                </td>

                                <td style="width: 33%;">
                                    <xsl:value-of select="p1:Tip_prijave"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tr>
                </table>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:10px ;">Zahtev za priznanje prvenstva iz ranijih prijava</h3>
                    <tr>
                        <th style="width: 33%;">Broj prijave</th>
                        <th style="width: 33%;">Datum podnosenja</th>
                        <th style="width: 33%;">Dvoslovna oznaka drzave/regionalne/medjunarodne organizacije</th>
                    </tr>
                    <tr>
                        <xsl:for-each select="//p1:Prijava">
                            <tr>
                                <td  style="width: 33%;">
                                    <xsl:value-of select="p1:Broj_prijave"/>
                                </td>

                                <td style="width: 33%;">
                                    <xsl:value-of select="p1:Datum_podnosenja"/>
                                </td>

                                <td style="width: 33%;">
                                    <xsl:value-of select="p1:Dvoslovna_oznaka"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
