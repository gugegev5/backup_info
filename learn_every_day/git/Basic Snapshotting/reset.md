1       |    index    | working tree
--|:--:|:--:|
--soft  |     不变     |不变
--mixed |     重置     |不变
--hard  |     重置     |重置
--merge |     重置     |更新
--keep  | 重置entries(staged => unstaged)  |更新

[working tree](https://git-scm.com/docs/gitglossary#Documentation/gitglossary.txt-aiddefworkingtreeaworkingtree): The tree of actual checked out files. The working tree normally contains the contents of the HEAD commit’s tree, plus any local changes that you have made but not yet committed.

[index](https://git-scm.com/docs/gitglossary#Documentation/gitglossary.txt-aiddefindexaindex):A collection of files with stat information, whose contents are stored as objects. The index is a stored version of your working tree. Truth be told, it can also contain a second, and even a third version of a working tree, which are used when merging.

[index entry](https://git-scm.com/docs/gitglossary#Documentation/gitglossary.txt-aiddefindexentryaindexentry):The information regarding a particular file, stored in the index. An index entry can be unmerged, if a merge was started, but not yet finished (i.e. if the index contains multiple versions of that file).
 
>keep: If a file that is different between <commit> and HEAD has local changes, reset is aborted.
