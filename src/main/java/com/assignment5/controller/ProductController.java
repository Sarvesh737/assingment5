package com.assignment5.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.assignment5.dao.ProductDao;
import com.assignment5.model.Product;

@Controller
@RequestMapping("/")
public class ProductController {

    private final ProductDao productDao;

    @Autowired
    public ProductController(ProductDao productDao) {
        this.productDao = productDao;
    }

    @GetMapping
    public String index(Model model) {
        model.addAttribute("products", productDao.getAllProducts());
        return "index";
    }

    @GetMapping("/add")
    public String showAddProductForm(Model model) {
        model.addAttribute("product", new Product());
        return "add";
    }

    @PostMapping("/add")
    public String addProduct(@ModelAttribute Product product) {
        productDao.save(product);
        return "redirect:/";
    }

    @GetMapping("/update/{productId}")
    public String showUpdateForm(@PathVariable("productId") int productId, Model model) {
        Product product = productDao.getProductById(productId);
        if (product != null) {
            model.addAttribute("product", product);
            return "update";
        } else {
            return "redirect:/";
        }
    }

    @PostMapping("/update/{productId}")
    public String updateProduct(@PathVariable("productId") int productId, @ModelAttribute Product product) {
        product.setId(productId);
        productDao.update(product);
        return "redirect:/";
    }

    @PostMapping("/increment/{productId}")
    public String incrementQuantity(@PathVariable("productId") int productId) {
        Product product = productDao.getProductById(productId);
        if (product != null) {
            product.setQuantity(product.getQuantity() + 1);
            productDao.update(product);
        }
        return "redirect:/";
    }

    @PostMapping("/decrement/{productId}")
    public String decrementQuantity(@PathVariable("productId") int productId) {
        Product product = productDao.getProductById(productId);
        if (product != null && product.getQuantity() > 0) {
            product.setQuantity(product.getQuantity() - 1);
            if (product.getQuantity() == 0) {
                productDao.delete(productId);
            } else {
                productDao.update(product);
            }
        }
        return "redirect:/";
    }
}
