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
print[[
<meta charset="utf8">
]]
print(string)
print[[
<script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/styles/tomorrow-night-bright.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/highlight.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.4/languages/lua.min.js"></script>
<script>hljs.initHighlightingOnLoad()</script>
]]

hd.hoedown_buffer_free(html)
hd.hoedown_document_free(document)
hd.hoedown_html_renderer_free(renderer)
