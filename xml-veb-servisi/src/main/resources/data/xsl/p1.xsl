<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:p1="http://www.ftn.uns.ac.rs/jaxb/p1"
                xmlns:fo="http://www.w3.org/1999/XSL/Format" version="2.0"
                xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:schemaLocation="http://www.w3.org/1999/XSL/Format ">
    <xsl:template match="/">
        <fo:root>
            <fo:layout-master-set>
                <fo:simple-page-master master-name="p1-page">
                    <fo:region-body/>
                </fo:simple-page-master>
            </fo:layout-master-set>
            <fo:page-sequence master-reference="p1-page">
                <fo:flow flow-name="xsl-region-body">
                    <fo:block text-align="center" font-size="30px" margin-top="20px">
                        Zahtev za priznavanje patenta
                    </fo:block>

                    <fo:block text-align="center" margin-top="15px">
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//p1:Informacije_o_ustanovi/p1:Naziv"/>,
                        </fo:inline>
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//p1:Informacije_o_ustanovi/p1:Adresa/p1:Ulica"/>
                        </fo:inline>
                        <xsl:text> </xsl:text>
                        <xsl:text> </xsl:text>
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//p1:Informacije_o_ustanovi/p1:Adresa/p1:Broj"/>,
                        </fo:inline>
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//p1:Informacije_o_ustanovi/p1:Adresa/p1:Postanski_broj"/>
                        </fo:inline>
                        <xsl:text> </xsl:text>
                        <xsl:text> </xsl:text>
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//p1:Informacije_o_ustanovi/p1:Adresa/p1:Grad"/>
                        </fo:inline>
                    </fo:block>

                    <fo:block>
                        <fo:table margin-bottom="50px" margin-top="30px">
                            <fo:table-column column-width="33%"/>
                            <fo:table-column column-width="33%"/>
                            <fo:table-column column-width="34%"/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Broj prijave</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Datum prijema</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Priznati datum podnosenja</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <xsl:for-each select="//p1:Popunjava_zavod">
                                    <fo:table-row border="1px solid darkgrey">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Broj_prijave"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Datum_prijema"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block>
                        <fo:block text-align="center" font-size="20px">
                            Naziv patenta
                        </fo:block>
                        <fo:table margin-bottom="50px" margin-top="10px">
                            <fo:table-column/>
                            <fo:table-column/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Na srpskom jeziku</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Na engleskom jeziku</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <xsl:for-each select="//p1:Naziv_patenta">
                                    <fo:table-row border="1px solid black">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Naziv_na_srpskom"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Naziv_na_engleskom"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                    
                    <fo:block>
                        <fo:block text-align="center" font-size="20px">
                            Podnosilac prijave
                        </fo:block>
                        <fo:table margin-top="10px">
                            <fo:table-column column-width="50%"/>
                            <fo:table-column column-width="50%"/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Ime</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Adresa</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <xsl:for-each select="//p1:Popunjava_podnosioc/p1:Podaci_o_podnosiocu/p1:Podnosioc">
                                    <fo:table-row border="1px solid black">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <xsl:choose>
                                                <xsl:when test="p1:Poslovno_ime">
                                                    <fo:block>
                                                        <xsl:value-of select="p1:Poslovno_ime"/>
                                                    </fo:block>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <fo:block>
                                                        <xsl:value-of select="p1:Ime"/>
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of select="p1:Prezime"/>
                                                    </fo:block>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <fo:inline>
                                                    <xsl:value-of select="p1:Adresa/p1:Ulica"/>
                                                </fo:inline>
                                                <xsl:text> </xsl:text>
                                                <fo:inline>
                                                    <xsl:value-of select="p1:Adresa/p1:Broj"/>
                                                </fo:inline>
                                                <fo:inline>
                                                    <xsl:value-of select="p1:Adresa/p1:Postanski_broj"/>
                                                </fo:inline>
                                                <xsl:text> </xsl:text>
                                                <fo:inline>
                                                    <xsl:value-of select="p1:Adresa/p1:Grad"/>
                                                </fo:inline>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
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
                                        <fo:block>Telefon</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Email</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Faks</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <xsl:for-each select="//p1:Popunjava_podnosioc/p1:Podaci_o_podnosiocu/p1:Podnosioc">
                                    <fo:table-row border="1px solid black">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block >
                                                <xsl:value-of select="p1:Kontakt/p1:Telefon"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block >
                                                <xsl:value-of select="p1:Kontakt/p1:E_posta"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block >
                                                <xsl:value-of select="p1:Kontakt/p1:Faks"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block margin-top="30px">
                        <fo:block text-align="center" font-size="20px">
                            Punomocnik
                        </fo:block>
                        <fo:table>
                            <fo:table-column/>
                            <fo:table-column/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Ime</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Adresa</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <xsl:for-each select="//p1:Popunjava_podnosioc/p1:Podaci_o_punomocniku/p1:Punomocnik">
                                    <fo:table-row border="1px solid black">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <xsl:choose>
                                                <xsl:when test="p1:Poslovno_ime">
                                                    <fo:block>
                                                        <xsl:value-of select="p1:Poslovno_ime"/>
                                                    </fo:block>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <fo:block>
                                                        <xsl:value-of select="p1:Ime"/>
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of select="p1:Prezime"/>
                                                    </fo:block>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <fo:inline>
                                                    <xsl:value-of select="p1:Adresa/p1:Ulica"/>
                                                </fo:inline>
                                                <xsl:text> </xsl:text>
                                                <fo:inline>
                                                    <xsl:value-of select="p1:Adresa/p1:Broj"/>
                                                </fo:inline>
                                                ,
                                                <fo:inline>
                                                    <xsl:value-of
                                                            select="p1:Adresa/p1:Postanski_broj"/>
                                                </fo:inline>
                                                <xsl:text> </xsl:text>
                                                <fo:inline>
                                                    <xsl:value-of select="p1:Adresa/p1:Grad"/>
                                                </fo:inline>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                    <fo:block>
                        <fo:table>
                            <fo:table-column column-width="33%"/>
                            <fo:table-column column-width="33%"/>
                            <fo:table-column column-width="34%"/>
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
                                </fo:table-row>
                                <xsl:for-each select="//p1:Popunjava_podnosioc/p1:Podaci_o_punomocniku/p1:Punomocnik">
                                    <fo:table-row border="1px solid black">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Kontakt/p1:Telefon"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Kontakt/p1:E_posta"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Kontakt/p1:Faks"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block margin-top="30px">
                        <fo:block text-align="center" font-size="20px">
                            Adresa i nacin dostavljanja
                        </fo:block>
                        <fo:table margin-bottom="50px">
                            <fo:table-column/>
                            <fo:table-column/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Adresa</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Nacin dostavljanja</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <xsl:for-each select="//p1:Popunjava_podnosioc/p1:Dostavljanje">
                                    <fo:table-row border="1px solid black">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <fo:inline>
                                                    <xsl:value-of select="p1:Adresa/p1:Ulica"/>
                                                </fo:inline>
                                                <xsl:text> </xsl:text>
                                                <fo:inline>
                                                    <xsl:value-of select="p1:Adresa/p1:Broj"/>
                                                </fo:inline>
                                                <fo:inline>
                                                    <xsl:value-of
                                                            select="p1:Adresa/p1:Postanski_broj"/>
                                                </fo:inline>
                                                <xsl:text> </xsl:text>
                                                <fo:inline>
                                                    <xsl:value-of select="p1:Adresa/p1:Grad"/>
                                                </fo:inline>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Nacin"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block text-align="center" font-size="20px">
                        Prvobitna/Osnovna prijava
                        <fo:table margin-bottom="50px">
                            <fo:table-column column-width="33%"/>
                            <fo:table-column column-width="33%"/>
                            <fo:table-column column-width="34%"/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Broj prvobitne/osnovne prijave</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Datum podnosenja prvobitne/osnovne prijave</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Tip prijave</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <xsl:for-each select="//p1:Prvobitna_prijava">
                                    <fo:table-row border="1px solid black">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Broj_prijave"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Datum_podnosenja"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Tip_prijave"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block text-align="center" font-size="20px">
                        Zahtev za priznanje prvenstva iz ranijih prijava
                        <fo:table>
                            <fo:table-column column-width="25%"/>
                            <fo:table-column column-width="25%"/>
                            <fo:table-column column-width="50%"/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Broj prijave</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Datum podnosenja</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Dvoslovna oznaka drzave/regionalne/medjunarodne organizacije</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <xsl:for-each select="//p1:Prijava">
                                    <fo:table-row border="1px solid darkgrey">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Broj_prijave"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Datum_podnosenja"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="p1:Dvoslovna_oznaka"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>
                </fo:flow>
            </fo:page-sequence>
        </fo:root>
    </xsl:template>
</xsl:stylesheet>
