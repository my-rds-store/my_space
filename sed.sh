for NAME in $(find build -name  "*.html")
do
	 sed -i "s/^.*查看页面源码.*$//g" $NAME
	 sed -i "s/利用\ Sphinx\ 构建，使用了\ 主题\ 由\ Read\ the\ Docs开发//g" $NAME

	 sed -i "s/利用.*https.*sphinx-doc.*Sphinx.* 构建，使用了//g" $NAME
	 sed -i "s/^.*href.*https.*github.*readthedocs.*sphinx_rtd_theme.*主题.*$//g" $NAME
	 sed -i "s/^.*由.*https.*readthedocs.*Read the Docs.*开发.*$//g" $NAME


	 # 利用 <a href="https://www.sphinx-doc.org/">Sphinx</a> 构建，使用了
     #    <a href="https://github.com/readthedocs/sphinx_rtd_theme">主题</a>
     #    由 <a href="https://readthedocs.org">Read the Docs</a>开发.


	 sed -i "s/^.* 版权所有 .*$//g" $NAME
	 #  <p>&#169; 版权所有 2017, Jiangxumin.</p>

done
