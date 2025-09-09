#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
百度主动推送脚本
用于向百度搜索引擎主动推送网站链接，无需在百度站长平台添加站点

使用方法:
1. 在百度站长平台获取推送token (如果有其他站点的话)
2. 运行: python baidu_push.py
3. 或者手动提交重要链接到百度

注意: 即使没有百度站长平台账户，搜索引擎仍会自然索引您的网站
"""

import requests
import json
import time
from urllib.parse import urljoin

class BaiduPush:
    def __init__(self, site_url="https://chenweilong915.github.io", token=None):
        self.site_url = site_url
        self.token = token
        self.push_url = "http://data.zz.baidu.com/urls"
        
    def get_important_urls(self):
        """获取网站重要页面链接"""
        important_urls = [
            self.site_url + "/",
            self.site_url + "/#about-me",
            self.site_url + "/#educations", 
            self.site_url + "/#research",
            self.site_url + "/#news",
            self.site_url + "/#honors-and-awards",
            self.site_url + "/#work-experience",
            self.site_url + "/#invited-talks",
            self.site_url + "/#publications",
            self.site_url + "/#guestbook",
        ]
        return important_urls
    
    def push_urls(self, urls):
        """推送URL到百度"""
        if not self.token:
            print("⚠️  未设置百度推送token，跳过自动推送")
            print("💡 您可以手动访问以下链接让百度发现您的网站：")
            for url in urls:
                print(f"   📄 {url}")
            return False
            
        # 准备推送数据
        data = "\n".join(urls)
        
        params = {
            'site': self.site_url,
            'token': self.token
        }
        
        headers = {
            'Content-Type': 'text/plain'
        }
        
        try:
            response = requests.post(
                self.push_url,
                params=params,
                data=data.encode('utf-8'),
                headers=headers,
                timeout=10
            )
            
            if response.status_code == 200:
                result = response.json()
                print(f"✅ 百度推送成功！")
                print(f"   今日推送: {result.get('success', 0)} 条")
                print(f"   今日剩余: {result.get('remain', 0)} 条")
                return True
            else:
                print(f"❌ 百度推送失败: HTTP {response.status_code}")
                print(f"   响应内容: {response.text}")
                return False
                
        except requests.exceptions.RequestException as e:
            print(f"❌ 推送请求失败: {e}")
            return False
    
    def manual_submission_guide(self):
        """显示手动提交指南"""
        print("\n📋 百度搜索引擎收录替代方案：")
        print("=" * 50)
        
        print("\n1️⃣ 自然收录 (推荐)")
        print("   - 百度会自动发现和索引您的网站")
        print("   - 确保网站内容质量高、更新频率规律")
        print("   - 通常需要 2-4 周时间")
        
        print("\n2️⃣ 外部链接引导")
        print("   - 在知乎、CSDN、博客园等平台发布文章并链接到您的网站")
        print("   - 在学术平台(如ResearchGate)添加网站链接")
        print("   - 通过社交媒体分享网站内容")
        
        print("\n3️⃣ 直接搜索引导")
        print("   - 在百度搜索：site:chenweilong915.github.io")
        print("   - 搜索您的姓名：陈维龙、weilong chen")
        print("   - 搜索相关学术内容引导百度发现")
        
        print("\n4️⃣ 百度其他提交方式")
        print("   - 百度搜索资源平台的快速收录功能")
        print("   - 使用百度搜索框的\"网站收录\"功能")
        print("   - 通过百度知道、百度百科等产品添加链接")
        
        print("\n💡 重要提示：")
        print("   即使不在百度站长平台添加网站，")
        print("   您的网站仍然会被百度自然索引收录！")

def main():
    print("🔍 百度搜索引擎推送工具")
    print("=" * 40)
    
    # 初始化推送器
    pusher = BaiduPush()
    
    # 获取重要页面
    urls = pusher.get_important_urls()
    
    print(f"\n📄 准备推送 {len(urls)} 个重要页面：")
    for i, url in enumerate(urls, 1):
        print(f"   {i}. {url}")
    
    # 尝试推送
    print(f"\n🚀 开始推送到百度...")
    success = pusher.push_urls(urls)
    
    if not success:
        # 显示替代方案
        pusher.manual_submission_guide()
    
    print(f"\n✅ 处理完成！")
    print(f"🌐 您的网站: {pusher.site_url}")
    print(f"📊 sitemap地址: {pusher.site_url}/sitemap.xml")

if __name__ == "__main__":
    main()
