<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt"
    exclude-result-prefixes="msxsl">

	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">

		<strong>Kõik suunad:</strong>

		<xsl:for-each select="Reisid/Reis[Transport='Lennureis']">
			<xsl:sort select="Suund/Kestvus" data-type="number" order="descending"/>

			<h1>
				<xsl:value-of select="Suund/Riik"/>
			</h1>

			<ul>
				<li>
					<xsl:attribute name="style">background-color: yellow;</xsl:attribute>
					Riik: <xsl:value-of select="Suund/Riik"/>
				</li>

				<li>
					<xsl:attribute name="style">background-color: yellow;</xsl:attribute>
					Kestvus: <xsl:value-of select="Suund/Kestvus"/> päeva
				</li>

				<li>
					Transport: <xsl:value-of select="Transport"/>
				</li>

				<li>
					Majutus: <xsl:value-of select="Majutus"/>
				</li>

				<li>
					Ekskursioonid: <xsl:value-of select="Ekskursioonid"/> €
				</li>

				<li>
					Muud kulud: <xsl:value-of select="MuudKulud"/> €
				</li>

				<li>
					Hinnang: <xsl:value-of select="Hinnang"/>/5
				</li>

				<li>
					Reisihind: <xsl:value-of select="Reisihind"/> €
				</li>

				<li>
					Kogumaksumus: <xsl:value-of select="Reisihind + Ekskursioonid + MuudKulud"/> € Kogu reisi maksumus
				</li>
			</ul>

			<xsl:if test="Suund/Kestvus &gt; 7">
				<p>
					<xsl:attribute name="style">background-color: red;</xsl:attribute>
					<strong>Pikk reis &gt; 7 kestvus päeva</strong>
				</p>
			</xsl:if>

		</xsl:for-each>


		<strong>Reisid tabel</strong>
		<br>
			
		</br>

		<table>

			<tr>
				<th>Riik</th>
				<th>Kestvus</th>
				<th>Transport</th>
				<th>Majutus</th>
				<th>Ekskursioonid</th>
				<th>Muud kulud</th>
				<th>Hinnang</th>
				<th>Reisihind</th>
				<th>Kogumaksumus</th>
			</tr>

			<xsl:for-each select="Reisid/Reis">

				<tr>

					<td>
						<xsl:value-of select="Suund/Riik"/>
					</td>
	
					<td>
						<xsl:value-of select="Suund/Kestvus"/> päeva
					</td>

					<td>
						<xsl:value-of select="Transport"/>
					</td>

					<td>
						<xsl:value-of select="Majutus"/>
					</td>

					<td>
						<xsl:value-of select="Ekskursioonid"/> €
					</td>

					<td>
						<xsl:value-of select="MuudKulud"/> €
					</td>

					<td>
						<xsl:value-of select="Hinnang"/>/5
					</td>

					<td>
						<xsl:value-of select="Reisihind"/> €
					</td>

					<td>
						<xsl:value-of select="Reisihind + Ekskursioonid + MuudKulud"/> €
					</td>

				</tr>

			</xsl:for-each>

		</table>

	</xsl:template>

</xsl:stylesheet>	