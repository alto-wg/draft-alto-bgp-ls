TARGETS_DRAFTS := draft-zhang-alto-bgp-ls
TARGETS_TAGS := draft-zhang-alto-bgp-ls-00
.INTERMEDIATE: draft-zhang-alto-bgp-ls-00.md
draft-zhang-alto-bgp-ls-00.md:
	git show "draft-zhang-alto-bgp-ls-00:draft-zhang-alto-bgp-ls.md" | sed -e 's/draft-zhang-alto-bgp-ls-latest/draft-zhang-alto-bgp-ls-00/g' >$@
draft-zhang-alto-bgp-ls-01.md: draft-zhang-alto-bgp-ls.md
	sed -e 's/draft-zhang-alto-bgp-ls-latest/draft-zhang-alto-bgp-ls-01/g' $< >$@
diff-draft-zhang-alto-bgp-ls.html: draft-zhang-alto-bgp-ls-00.txt draft-zhang-alto-bgp-ls-01.txt
	-$(rfcdiff) --html --stdout $^ > $@
