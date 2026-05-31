# leetcode-skill

三个给 [Claude Code](https://claude.com/claude-code) 用的 skill，帮你建立刷 LeetCode 的节奏。设计目标只有两个：**治拖延**和**逼你真懂**。零外部依赖，所有数据都是你本地 / Obsidian 里的纯文本 Markdown，没有 CLI、没有后台进程、不抓取 LeetCode。

## 三个 skill

| 命令 | 什么时候敲 | 干什么 |
|---|---|---|
| `/lc-go` | 坐下来不知道干嘛 | 只读，给你今日该复习的旧题 + 下一道新题，**零决策直接开干**（治拖延） |
| `/lc-done` | 做完一题 | 先**苏格拉底式追问逼你讲明白**，再用你的话整理成简洁的题解笔记，登记 3 天后复习 |
| `/lc-review` | 想复习 | **先盖住答案让你回忆**，再对照笔记考核，间隔 `3→7→15` 天递增，通关即毕业 🎓 |

题单是 **LeetCode 热题 100**，按官方 17 个专题顺序排列（专题突破）。笔记风格参考灵茶山艾府：从暴力到最优的思路推导、明确状态定义、清晰复杂度、可复用模板。

## 设计取舍

- **节奏只降摩擦，不主动推送**：没有定时通知。你打开就敲 `/lc-go`，它告诉你现在做哪道。
- **笔记必须你先讲明白**：`/lc-done` 不替你写笔记，先反问你为什么这么解、卡在哪、边界是什么，用你的回答生成笔记——讲不明白就是没真懂。
- **复习用主动回忆**：`/lc-review` 先不给答案，逼你凭记忆重建，比重读笔记记得牢。
- **streak 按真练习算**：只有 `/lc-done` 或 `/lc-review` 才算当天打卡，光敲 `/lc-go` 不算。

## 安装

```bash
git clone https://github.com/beyondaprilzjl-lab/leetcode-skill.git
cd leetcode-skill
bash install.sh
```

`install.sh` 会把三个 skill 拷到 `~/.claude/skills/`，并在数据目录初始化题单和复习表。

### 数据目录放哪

数据目录由环境变量 `LC_DATA_DIR` 决定，**默认 `~/leetcode`**。想放进 Obsidian 仓库，先设置再装：

```bash
echo 'export LC_DATA_DIR="$HOME/Documents/MyVault/leetcode"' >> ~/.zshrc
source ~/.zshrc
bash install.sh
```

装完后数据目录长这样：

```
$LC_DATA_DIR/
├── _题单.md      # Hot 100 专题题单，打勾推进
├── _复习表.md    # 复习日程 + streak（自动维护）
└── 题解/         # 每题一篇笔记
```

## 用法

```
/lc-go        # 开始：今日复习 + 下一道新题
（去 LeetCode 做题）
/lc-done      # 做完复盘
/lc-review    # 复习到期的旧题
```

## License

MIT
