package fr.philobox.gtsav.controllers;

import fr.philobox.gtsav.entities.ProviderEntity;
import fr.philobox.gtsav.services.ProviderManagementService;
import fr.philobox.gtsav.services.interfaces.IMaintenanceOperationService;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.awt.print.Pageable;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
@AllArgsConstructor
public class ProviderManagementController {
    private ProviderManagementService providerManagementService;

    @GetMapping(path = "/providers")
    public String getProviders(Model model,
                               @RequestParam(name = "page", defaultValue = "1") Integer page ,
                               @RequestParam(name = "size", defaultValue = "3") Integer size
    ) {
        Page<ProviderEntity> providerPage = providerManagementService.findAllProvider(PageRequest.of(page-1, size));
        model.addAttribute("page", page);
        model.addAttribute("size", size);
        model.addAttribute("currentPage", providerPage);
        model.addAttribute("providers", providerPage.getContent());
        List<Integer> totalPages = null;
        if (providerPage.getTotalPages() > 0) {
            totalPages = IntStream.range(0, providerPage.getTotalPages()).boxed().collect(Collectors.toList());
        }
        model.addAttribute("totalPages", totalPages);
        return "providers";
    }
}
