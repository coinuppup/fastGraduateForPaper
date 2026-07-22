
## Build
Full compile (XeLaTeX): `latexmk -r latexmkrc thesis`  
Clean: `latexmk -c thesis`

## Git Commit Convention

```
<type>(<scope>): <description>
```

| Type | Use |
|------|-----|
| `add` | 新增内容（段落、小节、图表） |
| `polish` | 润色改写、修正笔误、调整格式 |
| `bib` | 参考文献/引用 |
| `config` | 模板参数、编译设置 |
| `template` | 模板格式/样式文件 (hithesis.sty, hithesisbook.cls) |

Examples:

```
add(1.2): 补充国内外研究现状
add(3.3.1): 新增自适应切片算法描述
polish(4.1): 润色实验结果分析及修正笔误
polish(2.1): 调整段落顺序
bib(2): 补充悬垂区域识别文献
config: 引文格式恢复为 gbt7714-numerical
```

> `polish` 包含"调整格式"：正文格式调整（伪代码变量加粗、注释位置修正等）用 `polish`。`template` 仅用于修改 .sty/.cls 模板文件本身。

## Math Notation (hithesis.sty 预定义)

模板在 `hithesis.sty` 第308-316行定义了数学符号命令，论文中使用这些命令而非手动格式化：

| 命令 | 实现 | 用途 |
|------|------|------|
| `\theVector{}` | `\bm{}` | 向量（粗斜体） |
| `\theMatrix{}` | `\mathbb{}` | 矩阵（黑板粗体） |
| `\theSet{}` | `\mathcal{}` | 集合（花体） |
| `\theNetwork{}` | `\mathscr{}` | 网络 |
| `\theDirected{}` | `\overrightarrow{}` | 有向边 |
| `\theUndirected{}` | `\overline{}` | 无向边 |

## Algorithm2e

模板 `hithesis.sty` 已加载 `algorithm2e[algoruled,linesnumbered,algochapter]`，全局 `\DontPrintSemicolon` 在 `thesis.tex`。按章编号、标题五号、正文小四均由模板控制，论文中不重复设置。
