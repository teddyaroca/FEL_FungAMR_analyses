# [Fungal Ecology Lab (FEL)](www.fungalecologylab.org) FungAMR analyses 

This GitHub repository aims to summarize and model the data from Bedard et al. 2025[^1], in which they describe the novel database FungAMR, documenting global fungicide resistance genes, drugs, and their concentrations in fungi.

[^1]: Bédard C, Pageau A, Fijarczyk A, Mendoza-Salido D, Alcañiz AJ, Després PC, Durand R, Plante S, Alexander EMM, Rouleau FD, Jordan DF, Jay A, Giguère M, Bernier M, Sharma J, Maroc L, Gervais NC, Menon ACT, Gagnon-Arsenault I, Bakker S, Rhodes J, Dufresne PJ, Bharat A, Sellam A, De Luca DG, Gerstein A, Shapiro RS, Quijada NM, Landry CR. 2025. FungAMR: a comprehensive database for investigating fungal mutations associated with antimicrobial resistance. Nature Microbiology 10:2338–2352. https://doi.org/10.1038/s41564-025-02084-7



| **CONTENTS**                                         |
| -----------------------------------------------------|
|												|
| 1. [INSTRUCTIONS](#instructions)														|
| 2. [DATASETS](#datasets)                        |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[RStudio](#RStudio)                      |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Metadata](#metadata)                      |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Literature](#literature)                      |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[Figures](#figures)                      |
|																			|


# 1. INSTRUCTIONS 

## To contribute to this repository:

1. [Fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo) this repository from the top right.

<img width="479" alt="for_repo_image" src="https://docs.github.com/assets/cb-34352/mw-1440/images/help/repository/fork-button.webp">

2. Then, clone this repository to your laptop/desktop computer.

`
git clone https://github.com/teddyaroca/fungAMR_FEL_analyses.git
`

3. Make changes, add, or edit current files and commit those changes to your copy of this 
repository:

| Command | Description |
| :--- | :------------------------------------- |
| `git status` | You should be able to see the changes you made (new files/folders) in red |
| `git add .` | To add all the changes to the current repository |
| `git commit -m "I changed/added x,y,z files"` | To commit those changes back to github |
| `git push` | To push the changes back to your forked repository |

Note: If you are having troubles when you try `git push`, follow [these](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) instructions to add your personal token in the command line.

4. Once you have pushed your changes, [submit a pull request](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests):

<img width="479" alt="fork_repository_example" src="https://docs.github.com/assets/cb-34097/mw-1440/images/help/pull_requests/pull-request-compare-pull-request.webp">

Your changes will be reviewed by the website owner (teddyaroca) and accepted or denied depending on the accuracy/usefulness of the proposed changes.


# 2. Datasets

## RStudio

This folder contains the RStudio code (markdown) and procedure for plotting and analyses. 

## metadata

In this directory, we provide all datasets and metadata per species/strain.

## figures

Contains figures from analyses, including the initial exploratory figures modeling data.

## Literature

Contains a PDF copy of the [reference manuscript](literature/Bedard.et.al.2025.FungAMR_manuscript.pdf) by Bédard et al. 2025.
