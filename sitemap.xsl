<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" 
                xmlns:html="http://www.w3.org/TR/REC-html40"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html xmlns="http://www.w3.org/1999/xhtml">
			<head>
				<title>陈维龙的网站地图 / Weilong Chen's Sitemap</title>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<style type="text/css">
					body {
						font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
						font-size: 14px;
						color: #333;
						background-color: #f8f9fa;
						margin: 0;
						padding: 20px;
					}
					.container {
						max-width: 1000px;
						margin: 0 auto;
						background-color: white;
						border-radius: 8px;
						box-shadow: 0 2px 10px rgba(0,0,0,0.1);
						overflow: hidden;
					}
					.header {
						background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
						color: white;
						padding: 30px;
						text-align: center;
					}
					.header h1 {
						margin: 0;
						font-size: 28px;
						font-weight: 300;
					}
					.header p {
						margin: 10px 0 0 0;
						opacity: 0.9;
						font-size: 16px;
					}
					.info {
						padding: 20px 30px;
						background-color: #e3f2fd;
						border-left: 4px solid #2196f3;
						margin: 0;
					}
					.info p {
						margin: 0;
						color: #1565c0;
					}
					table {
						width: 100%;
						border-collapse: collapse;
						margin: 0;
					}
					th {
						background-color: #f5f5f5;
						padding: 15px 20px;
						text-align: left;
						font-weight: 600;
						color: #444;
						border-bottom: 2px solid #ddd;
					}
					td {
						padding: 12px 20px;
						border-bottom: 1px solid #eee;
						vertical-align: top;
					}
					tr:hover {
						background-color: #f9f9f9;
					}
					.url {
						color: #1976d2;
						text-decoration: none;
						word-break: break-all;
					}
					.url:hover {
						text-decoration: underline;
					}
					.priority {
						text-align: center;
						font-weight: bold;
					}
					.high { color: #4caf50; }
					.medium { color: #ff9800; }
					.low { color: #757575; }
					.lastmod, .changefreq {
						font-size: 12px;
						color: #666;
					}
					.stats {
						padding: 20px 30px;
						background-color: #f5f5f5;
						text-align: center;
						color: #666;
					}
					.icon {
						display: inline-block;
						width: 20px;
						text-align: center;
						margin-right: 8px;
					}
				</style>
			</head>
			<body>
				<div class="container">
					<div class="header">
						<h1>🗺️ 网站地图 / Sitemap</h1>
						<p>陈维龙的学术网站 / Weilong Chen's Academic Website</p>
					</div>
					
					<div class="info">
						<p>📍 此网站地图包含了网站的所有重要页面，帮助搜索引擎更好地索引网站内容。</p>
					</div>
					
					<table>
						<thead>
							<tr>
								<th style="width: 50%;">📄 页面地址 / URL</th>
								<th style="width: 15%;">🕐 最后修改 / Last Modified</th>
								<th style="width: 15%;">🔄 更新频率 / Change Frequency</th>
								<th style="width: 20%;">⭐ 优先级 / Priority</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="sitemap:urlset/sitemap:url">
								<tr>
									<td>
										<span class="icon">
											<xsl:choose>
												<xsl:when test="contains(sitemap:loc, '#about-me')">👨‍💼</xsl:when>
												<xsl:when test="contains(sitemap:loc, '#educations')">🎓</xsl:when>
												<xsl:when test="contains(sitemap:loc, '#research')">🔬</xsl:when>
												<xsl:when test="contains(sitemap:loc, '#news')">📰</xsl:when>
												<xsl:when test="contains(sitemap:loc, '#honors')">🏆</xsl:when>
												<xsl:when test="contains(sitemap:loc, '#work')">💼</xsl:when>
												<xsl:when test="contains(sitemap:loc, '#talks')">🎤</xsl:when>
												<xsl:when test="contains(sitemap:loc, '#publications')">📚</xsl:when>
												<xsl:when test="contains(sitemap:loc, '#guestbook')">💬</xsl:when>
												<xsl:when test="contains(sitemap:loc, '#stats')">📊</xsl:when>
												<xsl:otherwise>🏠</xsl:otherwise>
											</xsl:choose>
										</span>
										<a href="{sitemap:loc}" class="url">
											<xsl:value-of select="sitemap:loc"/>
										</a>
									</td>
									<td class="lastmod">
										<xsl:value-of select="concat(substring(sitemap:lastmod,0,11),concat(' ', substring(sitemap:lastmod,12,5)))"/>
									</td>
									<td class="changefreq">
										<xsl:value-of select="sitemap:changefreq"/>
									</td>
									<td class="priority">
										<xsl:choose>
											<xsl:when test="sitemap:priority &gt; 0.8">
												<span class="high"><xsl:value-of select="sitemap:priority"/></span>
											</xsl:when>
											<xsl:when test="sitemap:priority &gt; 0.5">
												<span class="medium"><xsl:value-of select="sitemap:priority"/></span>
											</xsl:when>
											<xsl:otherwise>
												<span class="low"><xsl:value-of select="sitemap:priority"/></span>
											</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
					
					<div class="stats">
						<p>📊 总计 <strong><xsl:value-of select="count(sitemap:urlset/sitemap:url)"/></strong> 个页面 | 🕐 生成时间: <xsl:value-of select="sitemap:urlset/sitemap:url[1]/sitemap:lastmod"/> | 🌐 网站: <a href="https://chenweilong915.github.io" class="url">chenweilong915.github.io</a></p>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
