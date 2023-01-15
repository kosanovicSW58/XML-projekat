<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:z1="http://www.ftn.uns.ac.rs/jaxb/z1"
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
                        Zahtev za priznanje ziga
                    </fo:block>

                    <fo:block text-align="center" margin-top="15px">
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//z1:informacije_o_ustanovi/z1:naziv"/>,
                        </fo:inline>
                        <xsl:text> </xsl:text>
                        <xsl:text> </xsl:text>
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//z1:informacije_o_ustanovi/z1:adresa/z1:ulica"/>
                        </fo:inline>
                        <xsl:text> </xsl:text>
                        <xsl:text> </xsl:text>
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//z1:informacije_o_ustanovi/z1:adresa/z1:broj"/>,
                        </fo:inline>
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//z1:informacije_o_ustanovi/z1:adresa/z1:postanski_broj"/>
                        </fo:inline>
                        <xsl:text> </xsl:text>
                        <xsl:text> </xsl:text>
                        <fo:inline font-size="15px">
                            <xsl:value-of select="//z1:informacije_o_ustanovi/z1:adresa/z1:grad"/>
                        </fo:inline>
                    </fo:block>

                    <fo:block>
                        <fo:block text-align="center" font-size="20px" margin-top="50px">
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
                                    <fo:table-row border="1px solid black">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <xsl:choose>
                                                <xsl:when test="//z1:popunjava_podnosilac/z1:podnosilac/z1:poslovno_ime">
                                                    <fo:block>
                                                        <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:poslovno_ime"/>
                                                    </fo:block>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <fo:block>
                                                        <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:ime"/> <xsl:text> </xsl:text> <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:prezime"/>
                                                    </fo:block>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <fo:inline>
                                                    <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:adresa/z1:ulica"/>
                                                </fo:inline>
                                                <xsl:text> </xsl:text>
                                                <fo:inline>
                                                    <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:adresa/z1:broj"/>
                                                </fo:inline>,
                                                <fo:inline>
                                                    <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:adresa/z1:postanski_broj"/>
                                                </fo:inline>
                                                <xsl:text> </xsl:text>
                                                <fo:inline>
                                                    <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:adresa/z1:grad"/>
                                                </fo:inline>
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
                                        <fo:block>Telefon</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Email</fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Faks</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                    <fo:table-row border="1px solid black">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block >
                                                <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:telefon"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block >
                                                <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:email"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block >
                                                <xsl:value-of select="//z1:popunjava_podnosilac/z1:podnosilac/z1:faks"/>
                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block>
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
                                <xsl:for-each select="//z1:popunjava_podnosilac/z1:punomocnik">
                                    <fo:table-row border="1px solid black">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <xsl:choose>
                                                <xsl:when test="z1:poslovno_ime">
                                                    <fo:block>
                                                        <xsl:value-of select="z1:poslovno_ime"/>
                                                    </fo:block>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <fo:block>
                                                        <xsl:value-of select="z1:ime"/> <xsl:text> </xsl:text> <xsl:value-of select="z1:prezime"/>
                                                    </fo:block>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <fo:inline>
                                                    <xsl:value-of select="z1:adresa/z1:ulica"/>
                                                </fo:inline>
                                                <xsl:text> </xsl:text>
                                                <fo:inline>
                                                    <xsl:value-of select="z1:adresa/z1:broj"/>
                                                </fo:inline>,
                                                <fo:inline>
                                                    <xsl:value-of select="z1:adresa/z1:postanski_broj"/>
                                                </fo:inline>
                                                <xsl:text> </xsl:text>
                                                <fo:inline>
                                                    <xsl:value-of select="z1:adresa/z1:grad"/>
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
                                <xsl:for-each select="//z1:popunjava_podnosilac/z1:punomocnik">
                                    <fo:table-row border="1px solid black">
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="z1:telefon"/>
                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="z1:email"/>                                            </fo:block>
                                        </fo:table-cell>
                                        <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                            <fo:block>
                                                <xsl:value-of select="z1:faks"/>                                            </fo:block>
                                        </fo:table-cell>
                                    </fo:table-row>
                                </xsl:for-each>
                            </fo:table-body>
                        </fo:table>
                    </fo:block>

                    <fo:block text-align="center" font-size="20px" margin-top="90px">
                        Informacije o zigu
                        <fo:table margin-bottom="50px">
                            <fo:table-column/>
                            <fo:table-body>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Naznacenje boje, odnosno boja iz kojih se zig sastoji</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                        <fo:block>
                                            <xsl:value-of select="//z1:zig/z1:naznacenje_boje"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Transliterizacija znaka</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                        <fo:block>
                                            <xsl:value-of select="//z1:zig/z1:transliteracija_znak"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Prevod znaka</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                        <fo:block>
                                            <xsl:value-of select="//z1:zig/z1:prevod_znaka"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Opis znaka</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                        <fo:block>
                                            <xsl:value-of select="//z1:zig/z1:opis_znaka"/>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Brojevi klase roba i usluga prema Nicanskoj klasifikaciji</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                        <fo:block>
                                            <xsl:for-each select="//z1:dodatne_informacije/z1:klasa_robe_i_uslaga/z1:klasa">
                                                <fo:inline>
                                                    <xsl:value-of select="."/>
                                                    <xsl:text> / </xsl:text>
                                                </fo:inline>
                                            </xsl:for-each>
                                        </fo:block>
                                    </fo:table-cell>
                                </fo:table-row>

                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" border="1px solid black">
                                        <fo:block>Zatrazeno pravo prvenstva i osnov</fo:block>
                                    </fo:table-cell>
                                </fo:table-row>
                                <fo:table-row border="1px solid black">
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080" border="1px solid black">
                                        <fo:block>
                                            <xsl:value-of select="//z1:zatrazeno_pravo_prvensta_i_osnov"/>
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
                                            <xsl:value-of select="//z1:broj_prijave_ziga"/>
                                        </fo:block>
                                    </fo:table-cell>
                                    <fo:table-cell padding="8px" font-size="15px" text-align="center" background-color="#808080">
                                        <fo:block>
                                            <xsl:value-of select="//z1:datum_podnosenja"/>
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
