# 仕様書
## 1, サービス名
MW-OP (https://mw-op.herokuapp.com)

#### 1-1 コンセプト
- 運用チームと開発チームのスムーズな連携により一つ一つの問題を解決する支援をする。
#### 1-2 利用者
- 運用チーム

#### 1-3 解決する問題
- サービス運用で必要となる故障報告と故障状況の追跡を可能にする

#### 1-5 見本サイト
- https://＊＊＊＊.com/

## 2, 見積り工数
- 期間

| 実装箇所 | 期間 |
|---|---|
| `フロントエンド` |5日|
| `バックエンド` |1３日|
| `サーバーデプロイ` |４日|
| `フロントエンドとバックエンドのつなぎ` |4日|

##3, UI設計
◯管理画面UI(1枚)

◯ユーザー側UI(3枚)
- 故障情報登録ページ
- 故障原因一覧ページ
- 故障原因登録ページ

■バックエンド機能
機能部分

故障案件関連
- 故障案件一覧表示機能(3日)
- 故障案件一覧表示機能(3日)
- 故障案件登録機能(3日)
- コメント登録機能(3日)
故障原因調査関連
- 故障原因登録機能(3日)
- 故障原因一覧表示機能(3日)
管理機能
- ユーザ登録, 編集, 削除
ログイン機能
- ログイン機能(1日)

## テーブル設計

### Users

|column|説明|type|default|null|備考|
|---|---|---|---|---|---|
| `email` | メールアドレス | string | | false | |
| `password` | パスワード | string | | false | |
| `firstname` | 名 | string |  | false | |
| `familyname` | 性 | string |  | false | |
| `depertment` | 所属部署 | string | | false | |

- 関連
  - `has_many :troubles`
  - `has_many :comments`


### Troubles

| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `start_date` | 発生日 | date | | false | |
| `start_time` | 発生時刻 | time | | false | |
| `end_date` | 回復日 | date | | false | |
| `end_time` | 回復時刻 | time | | false | |
| `vm` | 対象VM | string | | false | |
| `affected_user` | 影響ユーザ数 | integer | | false | |
| `about` | 故障内容 | string | | false | |
| `user_id` | 担当者 | refference | | false | |
| `account_id` | 原因 | refference | | false | |

- 関連
  - `belongs_to :user`
  - `has_many :comments`
  - `belongs_to :account`
  - `has_many :relations`

### CommentsForIssue

| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `user_id` | 紐づくUserのid | references | | false | |
| `issue_id` | 紐づくIssueのid | references | | false | |

- 関連
  - `belongs_to :user`
  - `belongs_to :issue`


### Accounts

| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `title` | タイトル | string | | false | |
| `user_id` | 紐づくUserのid | references | | false | |
| `status` | 状態フラグ | string | | false | |


- 関連
  - `belongs_to :user`
  - `belongs_to :trouble`
  - `has_many :comments`
  - `has_many :relations`


### CommentsForAccount

| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `user_id` | 紐づくUserのid | references | | false | |
| `account_id` | 紐づくAccountのid | references | | false | |

- 関連
  - `belongs_to :user`
  - `belongs_to :Account`

### Relations

| column | 説明 | type | default | null | 備考 |
|---|---|---|---|---|---|
| `trouble_id` | 紐づくTroubleのid | references | | false | |
| `issue_id` | 紐づくIssueのid | references | | false | |
