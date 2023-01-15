<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:z1="http://www.ftn.uns.ac.rs/jaxb/z1"
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
                <h1 style="text-align:center;">Zahtev za primanje ziga </h1>

                <div style="text-align: center;margin-top:15px;">
                    <inline>
                        <xsl:value-of select="//z1:informacije_o_ustanovi/z1:naziv"/>,
                    </inline>
                    <inline>
                        <xsl:value-of select="//z1:informacije_o_ustanovi/z1:adresa/z1:ulica"/>
                    </inline>

                    <inline>
                        <xsl:value-of select="//z1:informacije_o_ustanovi/z1:adresa/z1:broj"/>,
                    </inline>
                    <inline>
                        <xsl:value-of select="//z1:informacije_o_ustanovi/z1:adresa/z1:postanski_broj"/>
                    </inline>

                    <inline>
                        <xsl:value-of select="//z1:informacije_o_ustanovi/z1:adresa/z1:grad"/>
                    </inline>
                </div>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:5px ;">Podnosilac prijave </h3>
                    <tr>
                        <th style="width:50%;">Ime i Prezime</th>
                        <th style="width:50%;">Adresa</th>
                    </tr>
                    <tr>
                        <td style="width:50%;">
                            <xsl:choose>
                                <xsl:when test="//z1:popunjava_podnosilac/z1:podnosilac/z1:poslovno_ime">
                                    <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:poslovno_ime"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:ime"/> <xsl:text> </xsl:text> <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:prezime"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td style="width:50%;">
                            <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:adresa/z1:ulica"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:adresa/z1:broj"/>,
                            <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:adresa/z1:postanski_broj"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:adresa/z1:grad"/>
                        </td>
                    </tr>
                </table>
                <table style="margin-top:-50px;">
                    <tr>
                        <th style="width:33%;">Telefon</th>
                        <th style="width:33%;">Email</th>
                        <th style="width:33%;">Faks</th>
                    </tr>
                    <tr>
                        <td style="width:33%;">
                            <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:telefon"/>
                        </td>
                        <td style="width:33%;">
                            <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:email"/>
                        </td>
                        <td style="width:33%;">
                            <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:faks"/>
                        </td>
                    </tr>
                </table>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:5px ;">Punomocnik</h3>
                    <xsl:for-each select="//z1:popunjava_podnosilac/z1:punomocnik">
                        <tr>
                            <th style="width:50%;">Ime i Prezime</th>
                            <th style="width:50%;">Adresa</th>
                        </tr>
                        <tr>
                            <td style="width:50%;">
                                <xsl:choose>
                                    <xsl:when test="z1:poslovno_ime">
                                        <xsl:value-of select="z1:poslovno_ime"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <div class="inline">
                                            <xsl:value-of select="z1:ime"/> <xsl:text> </xsl:text> <xsl:value-of select="z1:prezime"/>
                                        </div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td style="width:50%;">
                                <xsl:value-of select="z1:adresa/z1:ulica"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="z1:adresa/z1:broj"/>,
                                <xsl:value-of select="z1:adresa/z1:postanski_broj"/>
                                <xsl:text> </xsl:text>
                                <xsl:value-of select="z1:adresa/z1:grad"/>
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
                    <xsl:for-each select="//z1:popunjava_podnosilac/z1:punomocnik">
                        <tr>
                            <td style="width:33%;">
                                <xsl:value-of select="z1:telefon"/>
                            </td>
                            <td style="width:33%;">
                                <xsl:value-of select="z1:email"/>
                            </td>
                            <td style="width:34%;">
                                <xsl:value-of select="z1:faks"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:10px ;">Informacije o zigu</h3>
                </table>

                <table style="margin-top:-50px;">
                    <tr>
                        <th>Naznacenje boje, tj. boja iz kojih se zig sastoji</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="//z1:zig/z1:naznacenje_boje"/>
                        </td>
                    </tr>
                </table>

                <xsl:if test="//z1:zig/z1:transliteracija_znak">
                    <table style="margin-top:-50px;">
                        <tr>
                            <th>Transliterizacija znaka</th>
                        </tr>
                        <tr>
                            <td>
                                <xsl:value-of select="//z1:zig/z1:transliteracija_znak"/>
                            </td>
                        </tr>
                    </table>
                </xsl:if>

                <xsl:if test="//z1:zig/z1:prevod_znaka">
                    <table style="margin-top:-50px;">
                        <tr>
                            <th>Prevod znaka</th>
                        </tr>
                        <tr>
                            <td>
                                <xsl:value-of select="//z1:zig/z1:prevod_znaka"/>
                            </td>
                        </tr>
                    </table>
                </xsl:if>

                <table style="margin-top:-50px;">
                    <tr>
                        <th>Opis znaka</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="//z1:zig/z1:opis_znaka"/>
                        </td>
                    </tr>
                </table>

                <table style="margin-top:-50px;">
                    <tr>
                        <th>Brojevi klase roba i usluga</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:for-each select="//z1:dodatne_informacije/z1:klasa_robe_i_uslaga/z1:klasa">
                                <xsl:value-of select="."/>
                                <xsl:text>  </xsl:text>
                            </xsl:for-each>
                        </td>
                    </tr>
                </table>

                <table style="margin-top:-50px;">
                    <tr>
                        <th>Zatrazeno pravo prvenstva i osnov</th>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="//z1:zatrazeno_pravo_prvensta_i_osnov"/>
                        </td>
                    </tr>
                </table>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:5px ;">Informacije o placanju </h3>
                    <tr>
                        <th style="width:50%;">Osnovna taksa</th>
                        <td style="width:50%;">
                            <xsl:value-of select="//z1:osnovna_taksa"/>
                        </td>
                    </tr>
                    <tr>
                        <th style="width:50%;">Za
                            <xsl:value-of select="//z1:za_klasa/z1:naziv_klase"/>
                            klasa</th>
                        <td style="width:50%;">
                            <xsl:value-of select="//z1:za_klasa/z1:suma"/>
                        </td>
                    </tr>
                    <tr>
                        <th style="width:50%;">Za graficko resenje</th>
                        <td style="width:50%;">
                            <xsl:value-of select="//z1:za_graficko_resenje"/>
                        </td>
                    </tr>
                    <tr>
                        <th style="width:50%;">Ukupno</th>
                        <td style="width:50%;">
                            <xsl:value-of select="//z1:ukupno"/>
                        </td>
                    </tr>
                </table>

                <table>
                    <h3 style="text-align:center; margin-top: 30px; margin-bottom:5px ;">Popunjava zavod</h3>
                    <tr>
                        <th>Prilozi uz zahtev</th>
                    </tr>
                    <tr>
                        <td>
                            Primer znaka
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="//z1:dokaz_o_uplati_takse"/>
                            Dokaz o uplati takse
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <xsl:value-of select="//z1:dokaz_o_pravu_prvenstva"/>
                            Dokaz o pravu prvenstva
                        </td>
                    </tr>
                </table>
                <table style="margin-top: 110px;">
                    <tr>
                        <th style="background-color: #FFF; border: 0px; width: 50%;">Broj prijave ziga</th>
                        <th style="background-color: #FFF; border: 0px; width: 50%">Datum podnosenja</th>
                    </tr>
                    <tr>
                        <td style="background-color: #FFF; border: 0px; width: 50%">
                            <xsl:value-of select="//z1:broj_prijave_ziga"/>
                        </td>
                        <td style="background-color: #FFF; border: 0px; width: 50%">
                            <xsl:value-of select="//z1:datum_podnosenja"/>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
