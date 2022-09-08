library(xtable)
library(tidyverse)
library(kableExtra)
library(clipr)


cria_tabela_parametros <-  function(){
    
    
    parametros <- tribble(
        ~Parameter, ~Description,
        
        "Development phase", "",
        
        r"($\tau$)", "mean time to develop at the start of the simulation, when there are no kludges in the cosdebase",
        
        r"($\kappa$)", "probability a commit has a kludge when developer is being diligent",
        
        r"($\Delta\kappa$)", "increase in the probability of a kludgy commit when the developer is being Kludgy",
        
        r"($\eta$)", r"(relative increase in time to develop when a code from a kludgy task is merged to the codebase. Hence, mean time to develop = $\tau \times (1+\eta)^{\#k}$)",
        
        r"($\sigma$)", r"(Standard deviation of the time to develop a commit)",
        
        "Review phase", "",

        r"($\phi$)", r"(Probability of false negatives(FN) when a reviewer is trying to detect kludge in a commit and is being Careful)",
        
        r"($\Delta\phi$)", r"(Increase in the probability of false negatives(FN) when a reviewer is detecting kludge in a commit and is being Negligent)",
         
        

    ) %>% 
        kable(
            format = "latex", 
            longtable = TRUE, 
            booktabs = TRUE,
            escape = FALSE
        ) %>%
        kable_styling(
            latex_options = c("repeat_header", "striped")
        ) %>% 
        column_spec(
            column = 2, width = "20em"
        ) %>% 
        row_spec(
            row = 1,
            hline_after = TRUE
        ) %>% 
        write_clip()
    
}