require "pathname"
class CreateFeatureBranchFromDevelop
  @wemrepo_path=""
  @featurebranch="";

  def initialize(path,branchname)
      @wemrepo_path=path
      @featurebranch=branchname
  end

  def checkoutBranch(sourcebranch)
     system("cd #{@wemrepo_path} && git branch | git checkout develop")
     if $?.exitstatus > 0
      return false
     end
     return true
  end
  def getCurrentBranch()
    currentbranch=`cd #{@wemrepo_path} && git branch | grep '*'`
    #currentbranch=%x[cd  && ls  ]
    return currentbranch.chomp()
  end

end
