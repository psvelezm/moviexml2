<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>

  <xsl:output method="html" indent="yes"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>Assignment 1</title>
        <style>
          body{
          font-family: Arial, Helvetica, sans-serif
          }

          table{
          background-color: #d4ecfb;
          border-collapse: collapse;
          margin-left: 10px;
          }

          th, tr, td{
          border: 1px solid black;
          }

          #id{
          width:3%;
          text-align: left;
          padding-left: 3px;
          }

          #title{
          width:25%;
          text-align: left;
          }

          #director{
          width:20%;
          text-align: left;
          }

          #year{
          width: 5%;
          text-align: left;
          }

          #headers{
          background-color: #FF4500;
          }

          td{
          padding-left: 3px;
          }
        </style>
      </head>
      <body>
        <h1>Top 15 Favorite Movies</h1>
        <!-- &lt; is the hex for < and &gt; is for the > symbol-->
        <!--
        <table>
          <tr id="headers">
            <th id="id">ID</th>
            <th id="title">Title</th>
            <th id="director">Director</th>
            <th id="year">Year</th>
            <th id="genre">Genre</th>
            <th id="link">Link</th>
          </tr>
          <xsl:if test="year &lt; 2005">
            <xsl:apply-templates select="AllMovies/movie">
              <xsl:sort select="title" order="ascending"/>
            </xsl:apply-templates>
          </xsl:if>
          <tr></tr>
          <xsl:if test="year &gt; 2005">
            <xsl:apply-templates select="AllMovies/movie">
              <xsl:sort select="title" order="ascending"/>
            </xsl:apply-templates>
          </xsl:if>
        </table>-->
        <xsl:variable name="header">
          <tr id="headers">
            <th id="id">ID</th>
            <th id="title">Title</th>
            <th id="director">Director</th>
            <th id="year">Year</th>
            <th id="genre">Genre</th>
            <th id="link">Link</th>
          </tr>
        </xsl:variable>
        <h1>Movies Older Than 2005</h1>
        <table>
          <xsl:copy-of select="$header"/>
          <xsl:apply-templates select="AllMovies/movie[year &lt; 2005] ">
            <xsl:sort select="title" order="ascending"/>
          </xsl:apply-templates>
          <tr>
            <td colspan="2">Number of movies:</td>
            <td>
              <xsl:value-of select="count(AllMovies/movie[year &lt; 2005])"/>
            </td>
          </tr>
        </table>
        <h1>Directors</h1>
        <xsl:for-each select="AllMovies/movie[year &lt; 2005]">
          <xsl:sort select="director" order="ascending"/>
          <ul>
            <li>
              <xsl:value-of select="director"/>
            </li>
          </ul>
        </xsl:for-each>
        <h1>2005 and Later</h1>
        <table>
          <xsl:copy-of select="$header"/>
          <xsl:apply-templates select="AllMovies/movie[year >= 2005] ">
            <xsl:sort select="title" order="ascending"/>
          </xsl:apply-templates>
          <tr>
            <td colspan="2">Number of movies:</td>
            <td>
              <xsl:value-of select="count(AllMovies/movie[year >= 2005])"/>
            </td>
          </tr>
        </table>
        <h1>Directors</h1>
        <xsl:for-each select="AllMovies/movie[year >= 2005]">
          <xsl:sort select="director" order="ascending"/>
          <ul>
            <li>
              <xsl:value-of select="director"/>
            </li>
          </ul>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="AllMovies/movie">
    <tr>
      <td>
        <xsl:value-of select="@id"/>
      </td>
      <td>
        <xsl:value-of select="title"/>
      </td>
      <td>
        <xsl:value-of select="director"/>
      </td>
      <td>
        <xsl:value-of select="year"/>
      </td>
      <td>
        <xsl:value-of select="genre"/>
      </td>
      <td>
        <xsl:choose>
          <xsl:when test="link">
            <a href="{link}">Rotten Tomato</a>
          </xsl:when>
          <xsl:otherwise>
            <xsl:apply-templates select="title"/>
          </xsl:otherwise>
        </xsl:choose>
        <!--<xsl:value-of select="link"/>-->
      </td>
    </tr>
  </xsl:template>

  <xsl:template match="title">
    <xsl:value-of select="."/>
  </xsl:template>

</xsl:stylesheet>
