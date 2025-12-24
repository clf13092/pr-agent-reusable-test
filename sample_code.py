# テスト用のPythonファイル - 意図的にコーディング規約違反を含む
# 新しいPR v2でのテスト実行
# secrets処理を修正後のテスト

import os,sys
import requests

# ハードコーディングされたAPIキー（セキュリティ違反）
API_KEY="sk-1234567890abcdef"
DATABASE_PASSWORD="password123"
SECRET_TOKEN="ghp_xxxxxxxxxxxxxxxxxxxx"  # 新しい機密情報を追加
AWS_ACCESS_KEY="AKIAIOSFODNN7EXAMPLE"  # AWS認証情報のハードコーディング

def badFunction(x,y):
    """不適切な関数名とフォーマット"""
    if x>y:
        return x+y
    else:
        return x-y

class badClass:
    """不適切なクラス名"""
    def __init__(self,name,age):
        self.name=name
        self.age=age
        # ハードコーディングされた設定
        self.db_host="localhost"
        self.db_password="admin123"
    
    def getData(self):
        # 長すぎる行（88文字を超える）
        response = requests.get(f"https://api.example.com/data?key={API_KEY}&host={self.db_host}&password={self.db_password}")
        return response.json()

if __name__=="__main__":
    obj=badClass("test",25)
    result=obj.getData()
    print(result)