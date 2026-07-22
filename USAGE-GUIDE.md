# 哈尔滨工业大学 LaTeX 论文写作指南（小白向）

这篇指南面向零基础用户。**你不需要懂 LaTeX 原理**，只要知道"在哪里写什么"就行。本文用到的所有规范都来自学校模板，你不需要自己设计任何格式。

---

## 目录

1. [项目文件结构](#1-项目文件结构)
2. [编译论文](#2-编译论文)
3. [写文字和标题](#3-写文字和标题)
4. [写公式](#4-写公式)
5. [数学符号规范](#5-数学符号规范)
6. [插入图片](#6-插入图片)
7. [插入表格](#7-插入表格)
8. [插入伪代码](#8-插入伪代码)
9. [引用文献](#9-引用文献)
10. [字号修改](#10-字号修改)
11. [常见问题](#11-常见问题)

---

## 1. 项目文件结构

```
fastgraduate/
├── thesis.tex          ← 主文件（控制编译顺序）
├── hithesis.sty        ← 模板样式（不要改）
├── hithesisbook.cls    ← 模板类型（不要改）
├── reference.bib       ← 参考文献库
├── latexmkrc           ← 编译配置
├── front/
│   ├── cover.tex       ← 封面信息（改你的名字、题目）
│   └── denotation.tex  ← 符号表
├── body/
│   ├── chapter3.tex    ← 你要写的章节（示例）
│   ├── introduction.tex ← 绪论
│   └── regu.tex        ← 撰写规范（参考）
├── back/
│   ├── conclusion.tex  ← 结论
│   └── acknowledgements.tex ← 致谢
└── figures/            ← 放图片的文件夹
```

**你需要改的文件只有这些**：`front/cover.tex`（封面信息）、`body/` 下的章节文件、`back/` 下的结论和致谢、`reference.bib`（参考文献）。

---

## 2. 编译论文

打开命令行，进入项目文件夹，输入：

```bash
latexmk -r latexmkrc thesis
```

编译成功后会在文件夹中生成 `thesis.pdf`。如果报错，检查是否有中文标点（逗号、引号等）误写成了英文标点。

清理临时文件：

```bash
latexmk -c thesis
```

---

## 3. 写文字和标题

### 3.1 章节标题

```latex
\chapter{你的章节中文标题}[Your English Title]
```

> **示例**：`\chapter{事件驱动拓扑集成切片算法}[Event-Driven Topology Slicing]`

### 3.2 节标题

```latex
\section{中文节标题}[English Section Title]
\subsection{中文小节标题}[English Subsection Title]
```

英文标题 `[...]` 可以省略，但建议写上。**标题中不要加标点符号**。

### 3.3 正文文字

直接写就行。段落之间空一行。

```latex
这是第一段文字。LPBF技术是通过逐层熔化金属粉末实现复杂三维结构的直接成型。

这是第二段文字。段落之间空一行就会自动分段。
```

### 3.4 列表

```latex
\begin{enumerate}
\item 第一点；
\item 第二点；
\item 第三点。
\end{enumerate}
```

---

## 4. 写公式

### 4.1 行内公式

用 `$...$` 包裹，公式会嵌入在文字中：

```latex
当顶点被 $n$ 个面片共用时，坐标用 $(x, y, z)$ 表示。
```

### 4.2 独立公式（带编号）

用 `\begin{equation}...\end{equation}`，公式会自动编号。用 `\label{}` 给公式贴标签，以后可以引用。

```latex
\begin{equation}
V - E + F = 2 \label{eq:euler}
\end{equation}
```

引用公式：`式\eqref{eq:euler}` → 输出"式（3-1）"

### 4.3 多行公式（cases）

```latex
\begin{equation}
\begin{cases}
\left|v_x - u_x\right| \le \varepsilon, \\[6pt]
\left|v_y - u_y\right| \le \varepsilon, \\[6pt]
\left|v_z - u_z\right| \le \varepsilon.
\end{cases} \label{eq:tolerance}
\end{equation}
```

其中 `\\[6pt]` 是换行并留 6pt 间距，`\le` 是 ≤，`\varepsilon` 是 ε。

### 4.4 公式中的常用符号

| 写法 | 效果 | 说明 |
|------|------|------|
| `x_i` | $x_i$ | 下标 |
| `x^2` | $x^2$ | 上标 |
| `\cdot` | ⋅ | 乘号 |
| `\times` | × | 叉乘 |
| `\frac{a}{b}` | 分数 a/b | 分式 |
| `\sqrt{x}` | √x | 根号 |
| `\sum` | Σ | 求和 |
| `\int` | ∫ | 积分 |
| `\le` | ≤ | 小于等于 |
| `\ge` | ≥ | 大于等于 |
| `\infty` | ∞ | 无穷 |
| `\to` | → | 箭头 |
| `\Rightarrow` | ⇒ | 双线箭头 |
| `\arccos` | arccos | 反余弦 |
| `\min` | min | 最小值 |
| `\max` | max | 最大值 |
| `\mathrm{mm}` | mm | 正体单位 |
| `\mathbf{R}` | **R** | 粗体向量 |
| `\left(...\right)` | 自适应括号 | 括号大小自动匹配内容 |
| `\left|...\right|` | 自适应绝对值 | 同上 |

### 4.5 公式后加变量注释

```latex
\begin{equation}
\ddot{\boldsymbol{\rho}} - \frac{\mu}{R_t^3}
\left(3\mathbf{R_t}\frac{\mathbf{R_t\rho}}{R_t^2} - \boldsymbol{\rho}\right) = \mathbf{a}
\label{eq:example}
\end{equation}
\begin{tabularx}{\textwidth}{@{}l@{\quad}r@{———}X@{}}
  式中 & $\boldsymbol{\rho}$ & 追踪飞行器与目标飞行器之间的相对位置矢量；\\
       & $\mathbf{a}$       & 推力所产生的加速度；\\
       & $\mathbf{R_t}$     & 目标飞行器在惯性坐标系中的位置矢量。
\end{tabularx}
```

---

## 5. 数学符号规范

模板在 `hithesis.sty` 中预定义了数学符号命令。**必须使用这些命令，不要自己用底层的 LaTeX 命令。**

| 模板命令 | 用途 | 示例 |
|----------|------|------|
| `\theVector{v}` | 向量（粗体） | $\theVector{v}$ = 速度向量 |
| `\theMatrix{A}` | 矩阵（黑板粗体） | $\theMatrix{A}$ = 变换矩阵 |
| `\theSet{S}` | 集合（花体） | $\theSet{S}$ = 切片集合 |
| `\theNetwork{N}` | 网络 | $\theNetwork{N}$ = 拓扑网络 |
| `\theDirected{AB}` | 有向边 | $\theDirected{AB}$ = A→B |
| `\theUndirected{AB}` | 无向边 | $\theUndirected{AB}$ = A—B |

```latex
% 正确用法
\theVector{v} \in \theSet{S}

% 错误用法（不要这样写）
\bm{v} \in \mathcal{S}
```

---

## 6. 插入图片

### 6.1 把图片放进文件夹

先把图片文件（PNG、JPG、PDF、EPS 都可以）放到 `figures/` 文件夹。

### 6.2 在正文中插入

```latex
\begin{figure}[htbp]
\centering
\includegraphics[width=0.7\textwidth]{my_figure.png}
\caption{这是图的中文标题}
\label{fig:my_label}
\end{figure}
```

- `[htbp]`：让 LaTeX 自动找位置（h=此处, t=页顶, b=页底, p=单独一页）
- `width=0.7\textwidth`：图片宽度为页面宽度的 70%
- `\caption{}`：图标题（只写中文，硕士论文只需中文图题）
- `\label{}`：贴标签，用于文中引用

### 6.3 引用图片

```latex
如图\ref{fig:my_label}所示，事件驱动架构包含三个核心组件。
```

输出效果："如图 3-1 所示"

---

## 7. 插入表格

学校模板要求使用**三线表**格式（只有顶线、表头线、底线三条横线，没有竖线）。

```latex
\begin{table}[htbp]
\caption{表的标题（中文）}
\label{tab:my_table}
\vspace{0.5em}\centering\wuhao
\begin{tabular}{cccc}   % 4列都居中(c)
\toprule
列1标题 & 列2标题 & 列3标题 & 列4标题 \\
\midrule
数据1 & 数据2 & 数据3 & 数据4 \\
数据5 & 数据6 & 数据7 & 数据8 \\
\bottomrule
\end{tabular}
\end{table}
```

关键点：
- `\wuhao` 是 5 号字（模板规定表格用 5 号）
- `\toprule` = 顶线（粗），`\midrule` = 中间线（细），`\bottomrule` = 底线（粗）
- `{cccc}` = 4 列全部居中。`l` = 左对齐，`r` = 右对齐
- 数值用 `\num{12345}` 包裹，会自动加千位分隔空格

### 引用表格

```latex
如表\ref{tab:my_table}所示，实验结果表明...
```

---

## 8. 插入伪代码

模板已加载 `algorithm2e` 宏包。伪代码按以下格式写：

```latex
\begin{algorithm}[htbp]
\caption{算法中文标题}
\label{alg:my_algo}
\KwIn{输入参数说明}
\KwOut{输出结果说明}
初始化变量\;

\ForEach{元素 $x$ in 集合 $S$}{
  处理 $x$\;
  \If{条件成立}{
    执行操作\;
  }
}

\While{条件成立}{
  循环体\;
}
\Return{结果}\;
\end{algorithm}
```

### 伪代码常用命令

| 命令 | 效果 |
|------|------|
| `\KwIn{...}` | 输入 |
| `\KwOut{...}` | 输出 |
| `\ForEach{...}{...}` | for-each 循环 |
| `\While{...}{...}` | while 循环 |
| `\Repeat{...}{...}` | repeat-until 循环 |
| `\If{...}{...}` | if 语句 |
| `\eIf{...}{...}{...}` | if-else |
| `\Return{...}` | 返回 |
| `\;` | 语句结束符 |
| `\leftarrow` | ← 赋值 |
| `\emptyset` | ∅ 空集 |
| `\textbf{break}` | **break**（粗体关键字） |

**注意**：不要加 `\DontPrintSemicolon`，模板已经在全局设置好了。

---

## 9. 引用文献

### 9.1 添加参考文献

在 `reference.bib` 中添加条目。找到一个现成的 bib 条目，复制进去。

```bibtex
@ARTICLE{cnarticle,
  AUTHOR  = "贾宝玉 and 林黛玉 and 薛宝钗 and 贾探春",
  TITLE   = "论刘姥姥食量大如牛之现实意义",
  JOURNAL = "红楼梦杂谈",
  PAGES   = "260--266",
  VOLUME  = "224",
  YEAR    = "1800",
  language = "zh",
}
```

其中 `cnarticle` 叫 **引用键（citation key）**，你在正文中用这个名字引用它。

### 9.2 在正文中引用

```latex
% 上标引用（最常用）
二次铣削\cite{cnproceed}。

% 同时引用多篇
形成了多种数学模型\cite{cnarticle, cnproceed}。

% 引用并指定页码
含量测定\cite[100-197]{cnarticle}。

% 正文中直接提及时用 \inlinecite
由文献\inlinecite{hithesis2017}可知...
```

### 9.3 怎么获取 bib 条目

- **Google Scholar**：搜索论文 → 点击"引用" → 选择 BibTeX → 复制
- **知网**：搜索论文 → 点击"导出" → 选择 EndNote → 导出后手动整理为 BibTeX 格式
- **Zotero**：用 Zotero 管理文献，一键导出 bib 文件

---

## 10. 字号修改

模板已经预设了全部字号，一般不需要改。如果确实需要调整，可以临时使用：

| 命令 | 大小 | 用途 |
|------|------|------|
| `\wuhao` | 5 号 | 表格、图题 |
| `\xiaowu` | 小 5 号 | 表格内容较多时 |
| `\normalsize` | 恢复正常 | 局部改字号后恢复 |
| `\small` | 略小 | -- |
| `\footnotesize` | 更小 | 脚注 |

**示例**：如果表格内容太多，把 5 号改成小 5 号：

```latex
\begin{table}[htbp]
\caption{表格标题}
\vspace{0.5em}\centering\xiaowu    % ← 这里改
\begin{tabular}{cccc}
...
```

**不建议在论文正文中随意改字号**，学校规范规定了各级标题和正文的字号，模板已经自动处理好了。

---

## 11. 常见问题

### Q1：编译报错 "Undefined control sequence"
→ 检查命令名是否拼写错误。常见错误：`\ref` 写成了 `\Ref`，`\eqref` 写成了 `\eqRef`。

### Q2：引用显示 "??"
→ 再编译一次。LaTeX 需要编译两次才能正确显示交叉引用。`latexmk` 会自动处理。

### Q3：图片不显示
→ 检查图片是否放在 `figures/` 文件夹中，文件名是否完全一致（含扩展名）。

### Q4：中文显示为乱码
→ 确认文件编码是 UTF-8。文件第一行必须有 `% !Mode:: "TeX:UTF-8"`。

### Q5：表格太宽超出页面
→ 把 `\begin{tabular}{cccc}` 改成 `\begin{tabularx}{\textwidth}{...}` (需要确认宏包已加载)，或者缩小字号到 `\xiaowu`。

### Q6：段首没有缩进
→ 模板已自动设置，如果某段不需要缩进，前面加 `\noindent`。

### Q7：公式太长需要换行
→ 等号处换行：
```latex
\begin{equation}
\begin{aligned}
V &= a + b + c + d + e \\
  &= f + g + h
\end{aligned}
\end{equation}
```

### Q8：LaTeX 在哪下载
→ 推荐安装 TeX Live（跨平台，免费）：https://tug.org/texlive/
→ Windows 用户也可以安装 MiKTeX：https://miktex.org/

---

## 附录：一份完整章节的写作流程

1. **创建章节文件** `body/chapterN.tex`
2. **在 `thesis.tex` 中添加** `\include{body/chapterN}`
3. **写标题**：`\chapter{中文}[English]`
4. **写各节内容**：文字 + 公式 + 图表 + 伪代码
5. **编译**：`latexmk -r latexmkrc thesis`
6. **检查**：打开 PDF 查看效果
7. **重复 4-6** 直到满意
