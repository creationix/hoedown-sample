# The largest heading (an <h1> tag)

## The second largest heading (an <h2> tag)

…

###### The 6th largest heading (an <h6> tag)

In the words of Abraham Lincoln:

> Pardon my french

*This text will be italic*

**This text will be bold**

**Everyone _must_ attend the meeting at 5 o'clock today.**

```lua
local ffi = require('ffi')
local hd = require('hoedown')
local bundle = require('luvi').bundle

local flags = hd.HOEDOWN_HTML_ESCAPE
local renderer = hd.hoedown_html_renderer_new(flags, 0)

local extensions = bit.bor(
  hd.HOEDOWN_EXT_BLOCK,
  hd.HOEDOWN_EXT_SPAN
)

local document = hd.hoedown_document_new(renderer, extensions, 16);

local html = hd.hoedown_buffer_new(16)

local markdown = bundle.readfile("sample.md")

hd.hoedown_document_render(document, html, markdown, #markdown);

local string = ffi.string(html.data, html.size)
```

$$
\begin{align*}
  & \phi(x,y) = \phi \left(\sum_{i=1}^n x_ie_i, \sum_{j=1}^n y_je_j \right)
  = \sum_{i=1}^n \sum_{j=1}^n x_i y_j \phi(e_i, e_j) = \\
  & (x_1, \ldots, x_n) \left( \begin{array}{ccc}
      \phi(e_1, e_1) & \cdots & \phi(e_1, e_n) \\
      \vdots & \ddots & \vdots \\
      \phi(e_n, e_1) & \cdots & \phi(e_n, e_n)
    \end{array} \right)
  \left( \begin{array}{c}
      y_1 \\
      \vdots \\
      y_n
    \end{array} \right)
\end{align*}
$$


Does it work with "smart quotes?"


Isn't it nice?

First Header  | Second Header
------------- | -------------
Content Cell  | Content Cell
Content Cell  | Content Cell
