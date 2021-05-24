<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <body>

                <h1>Drugstore list</h1>
                <p>The number of drugstores: <xsl:value-of select="count(//location)"/></p>
                <table>
                    <xsl:apply-templates select="//location"/>
                </table>

                <h1>Medicine list for Brest</h1>
                <p>The number of medicine in Brest: <xsl:value-of select="count(//location[@city='Brest']/medicine)"/></p>
                <table>
                    <xsl:apply-templates select="//location[@city='Brest']/medicine"/>
                </table>

                <h1>Medicine cheaper than $8</h1>
                <p>The number of medicine cheaper than $8: <xsl:value-of select="count(//medicine[@price &lt; 8])"/></p>
                <table>
                    <xsl:apply-templates select="//medicine[@price &lt; 8]"/>
                </table>

            </body>
        </html>
    </xsl:template>

    <xsl:template match="location">
        <tr><td><xsl:value-of select="@city"/></td><td><xsl:value-of select="@street"/></td><td><xsl:value-of select="@house"/></td></tr>
    </xsl:template>

    <xsl:template match="location[@city='Brest']/medicine">
        <tr><td><xsl:value-of select="@name"/></td><td><xsl:value-of select="@amount"/></td><td>$<xsl:value-of select="@price"/></td></tr>
    </xsl:template>

    <xsl:template match="medicine[@price &lt; 8]">
        <tr><td><xsl:value-of select="@name"/></td><td><xsl:value-of select="@amount"/></td><td>$<xsl:value-of select="@price"/></td></tr>
    </xsl:template>

</xsl:stylesheet>