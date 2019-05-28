# Sphinx Boilerplate

## ビルド

```
$ docker build . -t sphinx
```

## プロジェクトファイルの生成

ビルドできたら `sphinx-quickstart` で Sphinx プロジェクトファイルを生成します。



```
$ docker run -it --rm -v ${PWD}/docs:/sphinx sphinx sphinx-quickstart /sphinx

(中略)

You have two options for placing the build directory for Sphinx output.
Either, you use a directory "_build" within the root path, or you separate
"source" and "build" directories within the root path.
> Separate source and build directories (y/n) [n] # ソースの分割を有効にする (y)

(中略...プロジェクト名などを入力)
```

## sphinx_rtd_theme

sphinx_rtd_theme を使うために `./docs/source/conf.py` に追記します。

`html_theme_options` の内容は[お好み](https://sphinx-rtd-theme.readthedocs.io/en/latest/configuring.html)で。

※デフォルトの `html_theme = 'alabaster'` の記述は削除する

```
# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.

# ここから
import sphinx_rtd_theme
html_theme = 'sphinx_rtd_theme'
html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]

html_theme_options = {
    'canonical_url': '',
    'logo_only': False,
    'display_version': True,
    'prev_next_buttons_location': 'bottom',
    'style_external_links': False,
    'collapse_navigation': False,
    'sticky_navigation': True,
    'navigation_depth': 4,
    'includehidden': True,
    'titles_only': False
}
# ここまで
```

## Autobuild

次回以降はコンテナを起動すると `docker-autobuild` が走ります。

`docs` 内のコードを編集する度に自動でビルドされます。

コンテナのポート (8080) をホストに割り当てることにより、ブラウザで確認できます。

```
$ docker run -it --rm -p 0.0.0.0:8080:8080 -v ${PWD}/docs:/sphinx sphinx

+--------- manually triggered build ---------------------------------------------
| Running Sphinx v2.0.1
| loading translations [ja]... done
| building [mo]: targets for 0 po files that are out of date
| building [html]: targets for 1 source files that are out of date
| updating environment: 1 added, 0 changed, 0 removed
| reading sources... [100%] index
|
| looking for now-outdated files... none found
| pickling environment... done
| checking consistency... done
| preparing documents... done
| writing output... [100%] index
|
| generating indices... genindex
| writing additional pages... search
| copying static files... done
| copying extra files... done
| dumping search index in Japanese (code: ja) ... done
| dumping object inventory... done
| build succeeded.
|
| The HTML pages are in build/html.
+--------------------------------------------------------------------------------

[I 190528 02:03:52 server:296] Serving on http://0.0.0.0:8080
[I 190528 02:03:52 handlers:62] Start watching changes
```
