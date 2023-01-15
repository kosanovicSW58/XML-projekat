<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:a1="http://www.ftn.uns.ac.rs/jaxb/a1"
                xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.w3.org/1999/XSL/Format ">
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="a1-page">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="a1-page">
                <fo:flow flow-name="xsl-region-body">

                    <fo:block text-align="center" font-size="30px" margin-top="20px">
                        Zahtev za unosenje u evidenciju i deponovanje autorskih dela
                    </fo:block>

                    <fo:block text-align="center" margin-top="15px">
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//a1:Informacija_o_ustanovi/a1:Naziv"/>,
                        </fo:inline>
                        <xsl:text> </xsl:text>
                        <xsl:text> </xsl:text>
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//a1:Informacija_o_ustanovi/a1:Adresa/a1:Ulica"/>
                        </fo:inline>
                        <xsl:text> </xsl:text>
                        <xsl:text> </xsl:text>
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//a1:Informacija_o_ustanovi/a1:Adresa/a1:Broj"/>,
                        </fo:inline>
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//a1:Informacija_o_ustanovi/a1:Adresa/a1:Postanski_broj"/>
                        </fo:inline>
                        <xsl:text> </xsl:text>
                        <xsl:text> </xsl:text>
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//a1:Informacija_o_ustanovi/a1:Adresa/a1:Grad"/>
                        </fo:inline>
                    </fo:block>

                    <fo:block margin-top="30px">
                        <fo:block text-align="center" font-size="20px">
                            Podnosilac prijave
                        </fo:block>
                        <fo:table font-family="serif" border="1px" margin-top="10px">
                            <fo:table-column column-width="30%"/>
                            <fo:table-column column-width="45%"/>
                            <fo:table-column column-width="25%"/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Ime</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Adresa</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Telefon</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                    <xsl:choose>
                                            <xsl:when test="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Poslovno_ime">
                                                <fo:block>
                                                    <xsl:value-of
                                                            select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Poslovno_ime"/>
                                                </fo:block>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <fo:block>
                                                    <xsl:value-of
                                                            select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Ime"/>
                                                    <xsl:text> </xsl:text>
                                                    <xsl:value-of
                                                            select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Prezime"/>
                                                </fo:block>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </fo:table-cell>

                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                    <fo:block>
                                            <fo:inline>
                                                <xsl:value-of
                                                        select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Adresa/a1:Ulica"/>
                                            </fo:inline>
                                            <xsl:text> </xsl:text>
                                            <fo:inline>
                                                <xsl:value-of
                                                        select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Adresa/a1:Broj"/>
                                            </fo:inline>
                                            ,
                                            <fo:inline>
                                                <xsl:value-of
                                                        select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Adresa/a1:Postanski_broj"/>
                                            </fo:inline>
                                            <xsl:text> </xsl:text>
                                            <fo:inline>
                                                <xsl:value-of
                                                        select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Adresa/a1:Grad"/>
                                            </fo:inline>
                                            <xsl:text> </xsl:text>
                                            <fo:inline>
                                                <xsl:value-of
                                                        select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Adresa/a1:Drzava"/>
                                            </fo:inline>
                                        </fo:block>
                                    </fo:table-cell>

                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                    <fo:block>
                                            <xsl:value-of
                                                    select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Kontakt/a1:Telefon"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                    <fo:block>
                        <fo:table margin-bottom="50px">
                            <fo:table-column column-width="33%"/>
                            <fo:table-column column-width="33%"/>
                            <fo:table-column column-width="34%"/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Email</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Faks</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Sediste</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row border="1px solid black">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">      
                                        <fo:block>
                                            <xsl:value-of
                                                    select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Kontakt/a1:E_posta"/>
                                        </fo:block>
                                    </fo:table-cell>

                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">      
                                        <fo:block>
                                            <xsl:value-of
                                                    select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Kontakt/a1:Faks"/>
                                        </fo:block>
                                    </fo:table-cell>

                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">      
                                        <xsl:choose>
                                            <xsl:when test="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Sediste">
                                                <fo:block>
                                                    <xsl:value-of
                                                            select="//a1:Popunjava_podnosilac/a1:Podnosilac/a1:Sediste"/>
                                                </fo:block>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <fo:block>
                                                    <fo:block>/</fo:block>
                                                </fo:block>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block>
                        <fo:block text-align="center" font-size="20px">
                            Autori
                        </fo:block>
                        <fo:table font-family="serif" border="1px" margin-top="10px">
                            <fo:table-column column-width="33%"/>
                            <fo:table-column column-width="33%"/>
                            <fo:table-column column-width="34%"/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Ime</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Adresa</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Drzavljanstvo</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <xsl:for-each select="//a1:Popunjava_podnosilac/a1:Autori/*">
                                    <xsl:choose>
                                        <xsl:when test="a1:Autor">
                                            <fo:table-row border="1px solid black">
                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <xsl:value-of
                                                                select="a1:Ime"/>
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of
                                                                select="a1:Prezime"/>
                                                    </fo:block>
                                                </fo:table-cell>

                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <fo:inline>
                                                            <xsl:value-of
                                                                    select="a1:Adresa/a1:Ulica"/>
                                                        </fo:inline>
                                                        <xsl:text> </xsl:text>
                                                        <fo:inline>
                                                            <xsl:value-of
                                                                    select="a1:Adresa/a1:Broj"/>
                                                        </fo:inline>
                                                        ,
                                                        <fo:inline>
                                                            <xsl:value-of
                                                                    select="a1:Adresa/a1:Postanski_broj"/>
                                                        </fo:inline>
                                                        <xsl:text> </xsl:text>
                                                        <fo:inline>
                                                            <xsl:value-of
                                                                    select="a1:Adresa/a1:Grad"/>
                                                        </fo:inline>
                                                        <xsl:text> </xsl:text>
                                                        <fo:inline>
                                                            <xsl:value-of
                                                                    select="a1:Adresa/a1:Drzava"/>
                                                        </fo:inline>
                                                    </fo:block>
                                                </fo:table-cell>

                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <xsl:value-of
                                                                select="a1:Drzavljanstvo"/>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <fo:table-row border="1px solid black">
                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <xsl:text> Anonimous </xsl:text>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <xsl:text> X </xsl:text>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <xsl:text> X </xsl:text>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                    <fo:block>
                        <fo:table margin-bottom="50px">
                            <fo:table-column column-width="25%"/>
                            <fo:table-column column-width="25%"/>
                            <fo:table-column column-width="25%"/>
                            <fo:table-column column-width="25%"/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Telefon</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Email</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Faks</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Godina smrti</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <xsl:for-each select="//a1:Popunjava_podnosilac/a1:Autori/*">
                                    <xsl:choose>
                                        <xsl:when test="a1:Autor">
                                            <fo:table-row border="1px solid black">
                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <xsl:value-of
                                                                select="a1:Kontakt/a1:Telefon"/>
                                                    </fo:block>
                                                </fo:table-cell>

                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <xsl:value-of
                                                                select="a1:Kontakt/a1:E_posta"/>
                                                    </fo:block>
                                                </fo:table-cell>

                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <xsl:value-of
                                                                select="a1:Kontakt/a1:Faks"/>
                                                    </fo:block>
                                                </fo:table-cell>

                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <xsl:choose>
                                                        <xsl:when test="a1:Godina_smrti">
                                                            <fo:block>
                                                                <xsl:value-of
                                                                        select="a1:Godina_smrti"/>
                                                            </fo:block>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <fo:block>
                                                                <fo:block>/</fo:block>
                                                            </fo:block>
                                                        </xsl:otherwise>
                                                    </xsl:choose>

                                                </fo:table-cell>
                                            </fo:table-row>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <fo:table-row border="1px solid black">
                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <xsl:text> X </xsl:text>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <xsl:text> X </xsl:text>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <xsl:text> X </xsl:text>
                                                    </fo:block>
                                                </fo:table-cell>
                                                <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                                    <fo:block>
                                                        <xsl:text> X </xsl:text>
                                                    </fo:block>
                                                </fo:table-cell>
                                            </fo:table-row>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block>
                        <fo:block text-align="center" font-size="20px">
                            Autorsko delo
                        </fo:block>
                        <fo:table margin-bottom="50px">
                            <fo:table-column/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Naslov dela</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                        <fo:block>
                                            <xsl:value-of select="//a1:AutorskoDelo/a1:Naslov"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Vrsta dela</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                        <fo:block>
                                            <xsl:value-of select="//a1:AutorskoDelo/a1:Vrsta"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Forma dela</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                        <fo:block>
                                            <xsl:value-of select="//a1:AutorskoDelo/a1:Forma"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <xsl:if test="//a1:AutorskoDelo/a1:Podaci_o_naslovu_autorskog_dela">
                                    <fo:table-row>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>
                                                Podaci o zasnovanom autorskom delu
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080">
                                            <fo:block>
                                                <xsl:value-of select="//a1:AutorskoDelo/a1:Podaci_o_naslovu_autorskog_dela/a1:Naslov_autorskog_dela"/>
                                                <xsl:text> - </xsl:text>
                                                <xsl:value-of select="//a1:AutorskoDelo/a1:Podaci_o_naslovu_autorskog_dela/a1:Ime_autora"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="//a1:AutorskoDelo/a1:Stvoreno_u_radnom_odnosu">
                                        <fo:table-row>
                                            <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080">
                                                <fo:block>
                                                    <xsl:text> Stvoreno u radnom odnosu</xsl:text>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <fo:table-row>
                                            <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080">
                                            <fo:block>
                                                    <xsl:text> Nije stvoreno u radnom odnosu</xsl:text>
                                                </fo:block>
                                            </fo:table-cell>
                                        </fo:table-row>
                                    </xsl:otherwise>
                                </xsl:choose>

                                <xsl:if test="//a1:AutorskoDelo/a1:Nacin_koriscenja">
                                    <fo:table-row>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>
                                                Nacin koriscenja
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                    <fo:table-row>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                        <fo:block>
                                                <xsl:value-of select="//a1:AutorskoDelo/a1:Nacin_koriscenja"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:if>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block>
                        <fo:block text-align="center" font-size="20px" margin-bottom="15px">
                            Popunjava zavod
                        </fo:block>
                        <fo:table>
                            <fo:table-column/>
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>
                                            Prilozi uz zahtev
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080">
                                        <fo:block>
                                            <xsl:choose>
                                                <xsl:when test="//a1:Popunjava_zavod/a1:Prilozi_uz_zahtev/a1:Primer_autorskog_dela">
                                                    Primer autorskog dela
                                                </xsl:when>
                                            </xsl:choose>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080">
                                        <fo:block>
                                            <xsl:value-of select="//a1:Opis_sadrzaja_autorskog_dela"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080">
                                        <fo:block>
                                            <xsl:value-of select="//a1:Naziv_autorskog_dela"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block margin-top="180px" text-align="center">
                        <fo:table>
                            <fo:table-column column-width="50%"/>
                            <fo:table-column column-width="50%"/>
                            <fo:table-body>
                                <fo:table-row>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>
                                            Broj prijave
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>
                                            Datum podnosenja
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080">
                                        <fo:block>
                                            <xsl:value-of select="//a1:Broj_prijave"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080">
                                        <fo:block>
                                            <xsl:value-of select="//a1:Datum_podnosenja"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
