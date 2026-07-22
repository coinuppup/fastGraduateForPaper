# 哈尔滨工业大学 LaTeX 论文写作指南（小白向）

这篇指南面向零基础用户。你不需要懂 LaTeX 原理，只要知道"在哪里写什么"就行。

---

## 目录

1. [hithesis.sty 是什么](#1-hithesissty-是什么)
2. [项目文件结构](#2-项目文件结构)
3. [编译论文](#3-编译论文)
4. [写文字和标题](#4-写文字和标题)
5. [写公式](#5-写公式)
6. [数学符号规范](#6-数学符号规范)
7. [插入图片](#7-插入图片)
8. [插入表格](#8-插入表格)
9. [插入伪代码](#9-插入伪代码)
10. [引用规范速查](#10-引用规范速查)
11. [字号速查](#11-字号速查)
12. [常见问题](#12-常见问题)

---

## 1. hithesis.sty 是什么

`hithesis.sty` 是哈工大论文模板的**核心样式文件**。它做的事：

| 功能 | 它帮你干的事 |
|------|-------------|
| **加载宏包** | `siunitx`（数字格式化）、`bm`（粗体）、`algorithm2e`（伪代码）、`booktabs`（三线表）、`tikz`（绘图）等 |
| **配置伪代码** | 算法标题格式、编号规则、中英文双语标题支持 |
| **配置表格** | 三线表线宽 (`\toprule` 1.5pt / `\midrule` 1pt / `\bottomrule` 1.5pt) |
| **配置数字格式** | `\num{}` 自动处理千位分隔（≥4 位数字时） |

**这个文件你不要改。** 你只需要用它提供的命令来写论文。

---

## 2. 项目文件结构

```
fastgraduate/
├── thesis.tex          ← 主文件（控制编译顺序和全局设置）
├── hithesis.sty        ← 模板样式（不要改！）
├── hithesisbook.cls    ← 模板类型（不要改！）
├── hithesisbook.cfg    ← 模板配置（不要改！）
├── reference.bib       ← 参考文献库
├── latexmkrc           ← 编译配置
├── front/
│   ├── cover.tex       ← 封面信息（改你的名字、题目等）
│   └── denotation.tex  ← 符号表
├── body/
│   ├── preface.tex     ← 前言
│   ├── chapter3.tex    ← 你的章节
│   ├── introduction.tex ← 绪论
│   └── regu.tex        ← 学校撰写规范（仅供参考）
├── back/
│   ├── conclusion.tex  ← 结论
│   └── acknowledgements.tex ← 致谢
└── figures/            ← 放图片的文件夹
```

**你需要改的文件**：`front/cover.tex`、`body/` 下的章节、`back/` 下的结论和致谢、`reference.bib`。

---

## 3. 编译论文

打开命令行，进入项目文件夹，输入：

```bash
latexmk -r latexmkrc thesis
```

编译成功后生成 `thesis.pdf`。

清理临时文件：

```bash
latexmk -c thesis
```

---

## 4. 写文字和标题

### 4.1 章标题

```latex
\chapter{中文标题}[English Title]
```

示例：
```latex
\chapter{事件驱动拓扑集成切片算法}[Event-Driven Topology-Integrated Slicing Algorithm]
```

### 4.2 节标题

```latex
\section{中文节标题}
\subsection{中文小节标题}
\subsubsection{中文小小节标题}
```

### 4.3 标题层级与字号

模板已预设全部标题格式，**你不需要手动调字号**，只需使用对应的标题命令即可。

| 层级 | 命令 | 字号 | 磅值 | 字体 |
|------|------|------|------|------|
| 章标题 | `\chapter{}` | 小二 | 18bp | 黑体加粗居中 |
| 节标题 | `\section{}` | 小三 | 15bp | 黑体 |
| 小节标题 | `\subsection{}` | 四号 | 14bp | 黑体 |
| 小小节标题 | `\subsubsection{}` | 小四 | 12bp | 黑体 |
| 正文 | — | 小四 | 12bp | 宋体 |

### 4.4 正文文字

直接写。段落之间空一行。

### 4.5 列表

```latex
\begin{enumerate}
\item 第一点；
\item 第二点；
\end{enumerate}
```

---

## 5. 写公式

### 5.1 行内公式

```latex
当顶点被 $n$ 个面片共用时，坐标用 $(x, y, z)$ 表示。
```

### 5.2 独立公式（带编号）

```latex
\begin{equation}
V - E + F = 2 \label{eq:euler}
\end{equation}
```

引用公式：`式\eqref{eq:euler}` → 输出 "式（3-1）"

### 5.3 多行公式

```latex
\begin{equation}
\begin{cases}
\left|v_x - u_x\right| \le \varepsilon, \\[6pt]
\left|v_y - u_y\right| \le \varepsilon, \\[6pt]
\left|v_z - u_z\right| \le \varepsilon.
\end{cases} \label{eq:tolerance}
\end{equation}
```

### 5.4 公式常用符号速查

| 写法 | 效果 | 写法 | 效果 |
|------|------|------|------|
| `x_i` | 下标 | `x^2` | 上标 |
| `\frac{a}{b}` | 分数 | `\sqrt{x}` | 根号 |
| `\cdot` | ⋅ | `\times` | × |
| `\sum` | Σ | `\int` | ∫ |
| `\le` | ≤ | `\ge` | ≥ |
| `\infty` | ∞ | `\to` | → |
| `\min` | min | `\max` | max |
| `\mathrm{mm}` | 正体单位 | `\mathbf{R}` | 粗体 |
| `\left(...\right)` | 自适应括号 | `\left|...\right|` | 自适应绝对值 |
| `\arccos` | arccos | `\varepsilon` | ε |

### 5.5 公式后加变量注释

```latex
\begin{equation}
\bm{\ddot{\rho}} - \frac{\mu}{R_t^3}
\left(3\mathbf{R_t}\frac{\mathbf{R_t\rho}}{R_t^2} - \bm{\rho}\right) = \mathbf{a}
\label{eq:example}
\end{equation}
\begin{tabularx}{\textwidth}{@{}l@{\quad}r@{———}X@{}}
  式中 & $\bm{\rho}$ & 追踪飞行器与目标飞行器之间的相对位置矢量；\\
       & $\mathbf{a}$       & 推力所产生的加速度。
\end{tabularx}
```

---

## 6. 数学符号规范

所有数学符号均使用 LaTeX 标准命令，无需模板包装。

| 标准命令 | 用途 | 示例 |
|----------|------|------|
| `\bm{v}` | 向量/集合（粗斜体，bm 宏包） | $\bm{v} \in \bm{S}$ |
| `\mathbb{R}` | 矩阵/数集（黑板粗体） | $\mathbb{R}^{m \times n}$ |
| `\mathscr{L}` | 网络/算子（手写体） | $\mathscr{L}$ |
| `\overrightarrow{AB}` | 有向边 | $\overrightarrow{AB}$ |
| `\overline{AB}` | 无向边 | $\overline{AB}$ |
| `\text{...}` | 正文体（数学模式中插入文字） | $\text{deg}(v)$ |

```latex
% 正确：直接用标准 LaTeX 命令
\bm{v} \in \bm{S},\quad \mathbb{R}^{m \times n},\quad \overrightarrow{AB}

% 错误：不要用 \mathbf 代替 \bm（显示效果不同）
\mathbf{v} \in \mathbf{S}
```

---

## 7. 插入图片

### 7.1 放图片

把图片文件（PNG、JPG、PDF、EPS 均可）放到 `figures/` 文件夹。

### 7.2 插入

```latex
\begin{figure}[htbp]
\centering
\includegraphics[width=0.7\textwidth]{my_figure.png}
\caption{图的中文标题}
\label{fig:my_label}
\end{figure}
```

- `width=0.7\textwidth` — 图片宽度 = 页面宽度 × 70%
- 硕士论文只用中文图题

### 7.3 引用

```latex
如图\ref{fig:my_label}所示...
```

输出："如图 3-1 所示"

### 7.4 多图并排（子图）

模板已加载 `subfigure` 宏包，支持多张图片并排显示：

```latex
\begin{figure}[htbp]
\centering
\subfigure[子图A标题]{\includegraphics[width=0.45\textwidth]{fig_a.png}}
\subfigure[子图B标题]{\includegraphics[width=0.45\textwidth]{fig_b.png}}
\caption{总图标题}
\label{fig:my_fig}
\end{figure}
```

- 每行两张图：各自宽度 0.45\textwidth
- 每行三张图：各自宽度 0.30\textwidth
- 子图自动编号为 (a), (b), (c)...
- 引用子图 `\ref{fig:my_fig}` 输出 "3-1 a)"

---

## 8. 插入表格

学校模板要求**三线表**（顶线粗 / 表头线细 / 底线粗，无竖线）。

```latex
\begin{table}[htbp]
\caption{表的标题}
\label{tab:my_table}
\vspace{0.5em}\centering\wuhao
\begin{tabular}{cccc}   % 4 列全部居中 (c = center, l = 左, r = 右)
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
- `\wuhao` = 5 号字（模板规定）
- `\toprule` / `\midrule` / `\bottomrule` = 三线
- 引用表格：`如表\ref{tab:my_table}所示`

---

## 9. 插入伪代码

模板已加载 `algorithm2e` 宏包。伪代码按以下格式：

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

### 常用命令

| 命令 | 效果 |
|------|------|
| `\KwIn{...}` | 输入 |
| `\KwOut{...}` | 输出 |
| `\ForEach{...}{...}` | for-each 循环 |
| `\For{...}{...}` | for 循环 |
| `\While{...}{...}` | while 循环 |
| `\Repeat{...}{...}` | repeat-until 循环 |
| `\If{...}{...}` | if 语句 |
| `\eIf{...}{...}{...}` | if-else |
| `\Return{...}` | 返回 |
| `\;` | 语句结束符 |
| `\leftarrow` | ← 赋值 |
| `\emptyset` | ∅ 空集 |
| `\textbf{break}` | **break**（粗体关键字） |
| `\textbf{continue}` | **continue** |
| `\tcp*{注释}` | 行内注释 |

**注意**：不要写 `\DontPrintSemicolon`，模板已在全局设置。

---

## 10. 引用规范速查

模板所有编号均按章编序（如"3-1"表示第 3 章第 1 个）。

### 10.1 图表算法公式引用

| 对象 | 写法 | 输出示例 |
|------|------|----------|
| 图 | `图\ref{fig:xxx}` | 图 3-1 |
| 表 | `表\ref{tab:xxx}` | 表 3-1 |
| 算法 | `算法\ref{alg:xxx}` | 算法 3-1 |
| 公式 | `式\eqref{eq:xxx}` | 式(3-1) |

注意：
- 图/表/算法用 `\ref{}`，公式用 `\eqref{}`（自动带括号）
- 子图引用 `\ref{fig:xxx}` → 输出 "3-1 a)"

### 10.2 文献引用

```bibtex
@ARTICLE{cnarticle,
  AUTHOR  = "张三 and 李四",
  TITLE   = "论文标题",
  JOURNAL = "期刊名",
  PAGES   = "260--266",
  VOLUME  = "224",
  YEAR    = "2024",
  language = "zh",
}
```

`cnarticle` 是**引用键**，你在正文中用这个名字引用它。

### 10.2 在正文中引用

```latex
% 上标引用（最常用）
二次铣削\cite{cnproceed}。

% 同时引用多篇
形成了多种数学模型\cite{cnarticle, cnproceed}。

% 引用并指定页码
含量测定\cite[100-197]{cnarticle}。

% 正文中直接提及（不带上标）
由文献\inlinecite{hithesis2017}可知...
```

### 10.3 获取 bib 条目

- **Google Scholar**：搜索 → 点"引用" → BibTeX → 复制
- **知网**：搜索 → 导出 → EndNote → 整理成 BibTeX
- **Zotero**：管理文献，一键导出 bib

---

## 11. 字号修改

模板已预设全部字号，一般不需要改。需要时可用：

| 命令 | 大小 | 用途 |
|------|------|------|
| `\wuhao` | 5 号 | 表格、图题、算法标题 |
| `\xiaowu` | 小 5 号 | 表格内容较多时 |
| `\normalsize` | 恢复默认 | 局部改字号后恢复 |

**不建议在正文中随意改字号**，模板已按要求自动处理。

---

## 12. 常见问题

| 问题 | 原因 | 解决 |
|------|------|------|
| 编译报 "Undefined control sequence" | 命令拼写错误 | 检查 `\ref` 不是 `\Ref`，`\eqref` 不是 `\eqRef` |
| 引用显示 "??" | 需再编译一次 | `latexmk` 会自动处理，再跑一次 |
| 图片不显示 | 文件名不匹配或路径不对 | 确认图片在 `figures/`，文件名完全一致 |
| 中文显示乱码 | 编码不是 UTF-8 | 文件第一行必须有 `% !Mode:: "TeX:UTF-8"` |
| 表格太宽 | 列太多或内容太长 | 缩小字号到 `\xiaowu` 或减少列 |
| 段首没缩进 | 模板已自动设 | 某段不要缩进时前面加 `\noindent` |
| 公式太长需换行 | align 环境 | `\begin{aligned}` 在等号处用 `&` 对齐，`\\` 换行 |
| 中文逗号显示为英文逗号 | 字体问题 | `thesis.tex` 中 `fontset=windows` 已修复 |
