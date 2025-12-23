# PR-Agent Reusable Workflow テストプロジェクト

このリポジトリは、外部のreusable workflowを使用してPR-Agentをテストするためのプロジェクトです。

## 🎯 テスト目的

- 外部リポジトリ（`clf13092/copilot_code_review_test`）のreusable workflowが正常に動作するかテスト
- プロジェクト固有のコーディング標準（`CODING_STANDARDS.md`）が適用されるかテスト
- 複数のファイルタイプ（Python、Terraform）でのレビューをテスト

## 📁 ファイル構成

- `sample_code.py` - 意図的にコーディング規約違反を含むPythonファイル
- `infrastructure.tf` - 意図的にセキュリティ問題を含むTerraformファイル
- `CODING_STANDARDS.md` - プロジェクト固有のコーディング標準
- `.github/workflows/pr-review.yml` - 外部reusable workflowを呼び出すワークフロー

## 🧪 期待される検出項目

### Python (`sample_code.py`)
- ハードコーディングされたAPIキー・パスワード
- 不適切な命名規則（関数名、クラス名）
- フォーマットの問題（スペース、改行）
- 長すぎる行

### Terraform (`infrastructure.tf`)
- セキュリティグループの過度な開放
- IAM権限の過度な付与
- ハードコーディングされた機密情報
- 命名規則違反

## 🚀 テスト手順

1. このリポジトリでPRを作成
2. サンプルファイルを編集
3. PR-Agentが自動実行されることを確認
4. 日本語でのレビューコメントが投稿されることを確認

## ⚙️ 使用している外部ワークフロー

```yaml
uses: clf13092/copilot_code_review_test/.github/workflows/reusable-pr-agent.yml@main
```

設定はデフォルト値を使用し、`custom_instructions_file`のみ指定しています。