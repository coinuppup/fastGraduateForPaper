
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

Examples:

```
add(1.2): 补充国内外研究现状
add(3.3.1): 新增自适应切片算法描述
polish(4.1): 润色实验结果分析及修正笔误
polish(2.1): 调整段落顺序
bib(2): 补充悬垂区域识别文献
config: 引文格式恢复为 gbt7714-numerical
```
