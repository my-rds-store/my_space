配置本地生成pdf
===================


一. 安装rst2pdf
-----------------

    .. code-block:: sh
       
        $ sudo pip install rst2pdf  -i https://pypi.mirrors.ustc.edu.cn/simple

二. 配置rst2pdf
------------------

告诉sphinx我们安装了rst2pdf，并且将其作为插件使用。修改conf.py中配置：

    .. code-block:: python

        on_rtd = os.environ.get('READTHEDOCS', None) == 'True'
        if on_rtd:
            extensions = ['sphinx.ext.autodoc',
                 'sphinx.ext.doctest',
                 'sphinx.ext.intersphinx',
                 'sphinx.ext.todo',
                 'sphinx.ext.coverage',
                 'sphinx.ext.ifconfig',
                 'sphinx.ext.viewcode',
                 'sphinx.ext.githubpages',
                 ]
        else:
            extensions = [ 
              'sphinx.ext.autodoc',
              'rst2pdf.pdfbuilder'
            ]  


在conf.py中添加PDF相关的配置：

    .. code-block:: python


        # -- Options for PDF output --------------------------------------------------
         
        # Grouping the document tree into PDF files. List of tuples
        # (source start file, target name, title, author, options).
        #
        # If there is more than one author, separate them with \\.
        # For example: r'Guido van Rossum\\Fred L. Drake, Jr., editor'
        #
        # The options element is a dictionary that lets you override
        # this config per-document.
        # For example,
        # ('index', u'MyProject', u'My Project', u'Author Name',
        #  dict(pdf_compressed = True))
        # would mean that specific document would be compressed
        # regardless of the global pdf_compressed setting.
         
        pdf_documents = [
            ('index', u'HanLP Handbook', u'HanLP Handbook', u'hankcs'),
        ]
         
        # A comma-separated list of custom stylesheets. Example:
        pdf_stylesheets = ['a3','zh_CN']
         
        # Create a compressed PDF
        # Use True/False or 1/0
        # Example: compressed=True
        #pdf_compressed = False
         
        # A colon-separated list of folders to search for fonts. Example:
        #pdf_font_path = ['C:\\Windows\\Fonts']
         
        # Language to be used for hyphenation support
        pdf_language = "zh_CN"
         
        # Mode for literal blocks wider than the frame. Can be
        # overflow, shrink or truncate
        pdf_fit_mode = "shrink"
         
        # Section level that forces a break page.
        # For example: 1 means top-level sections start in a new page
        # 0 means disabled
        #pdf_break_level = 0
         
        # When a section starts in a new page, force it to be 'even', 'odd',
        # or just use 'any'
        #pdf_breakside = 'any'
         
        # Insert footnotes where they are defined instead of
        # at the end.
        #pdf_inline_footnotes = True
         
        # verbosity level. 0 1 or 2
        #pdf_verbosity = 0
         
        # If false, no index is generated.
        #pdf_use_index = True
         
        # If false, no modindex is generated.
        #pdf_use_modindex = True
         
        # If false, no coverpage is generated.
        #pdf_use_coverpage = True
         
        # Documents to append as an appendix to all manuals.
        #pdf_appendices = []
         
        # Enable experimental feature to split table cells. Use it
        # if you get "DelayedTable too big" errors
        #pdf_splittables = False
         
        # Set the default DPI for images
        #pdf_default_dpi = 72
         
        # Enable rst2pdf extension modules (default is only vectorpdf)
        # you need vectorpdf if you want to use sphinx's graphviz support
        #pdf_extensions = ['vectorpdf']
         
        # Page template name for "regular" pages
        #pdf_page_template = 'cutePage'
         
        # Show Table Of Contents at the beginning?
        # pdf_use_toc = False
         
        # How many levels deep should the table of contents be?
        pdf_toc_depth = 2
         
        # Add section number to section references
        pdf_use_numbered_links = False
         
        # Background images fitting mode
        pdf_fit_background_mode = 'scale'


三. 样式表
-------------

在项目根目录下创建一个 **zh_CN.json** ,写入：

    .. code-block:: python

        {
          "embeddedFonts": [
            "simsun.ttc"
          ],
          "fontsAlias": {
            "stdFont": "simsun",
            "stdBold": "simsun",
            "stdItalic": "simsun",
            "stdBoldItalic": "simsun",
            "stdMono": "simsun",
            "stdMonoBold": "simsun",
            "stdMonoItalic": "simsun",
            "stdMonoBoldItalic": "simsun",
            "stdSans": "simsun",
            "stdSansBold": "simsun",
            "stdSansItalic": "simsun",
            "stdSansBoldItalic": "simsun"
          },
          "styles": [
            [
              "base",
              {
                "wordWrap": "CJK"
              }
            ],
            [
              "literal",
              {
                "wordWrap": "None"
              }
            ]
          ]
        }


四. 本地生成pdf

    .. code-block:: sh
        
       $ make pdf 


参考 `rst2pdf拓展sphinx生成PDF <http://www.hankcs.com/program/python/the-use-of-rst2pdf-to-expand-sphinx-to-generate-pdf.html>`_。   


