# pandoc-scholar must lie in current directory (to avoid bug)
# make pandoc-scholar will create a symlink (soft-link or alias in current directory): to use set PANDOC_SCHOLAR_INSTALL_PATH to correct value for local machine
ARTICLE_FILE=article.md
PANDOC_SCHOLAR_INSTALL_PATH   = ~/utils/pandoc-scholar

OUTFILE_PREFIX = outfiles/article
PANDOC_SCHOLAR_PATH   = pandoc-scholar
-include $(PANDOC_SCHOLAR_PATH)/Makefile

init:
	# Create outfile directories if needed
	mkdir -p $(OUTFILE_PREFIX)
	rmdir $(OUTFILE_PREFIX)

	# Delete pandoc-scholar if it exists
	rm -f $(PANDOC_SCHOLAR_PATH)

	# Create symlink to local install of pandoc-scholar
	ln -s $(PANDOC_SCHOLAR_INSTALL_PATH) $(PANDOC_SCHOLAR_PATH)

.PHONY: all clean
