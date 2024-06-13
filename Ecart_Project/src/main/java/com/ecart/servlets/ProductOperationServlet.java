package com.ecart.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ecart.dao.CategoryDao;
import com.ecart.dao.ProductDao;
import com.ecart.entity.Category;
import com.ecart.entity.Product;
import com.ecart.factory.FactoryProvider;

import javassist.bytecode.ByteArray;

@WebServlet("/addProductServlet")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductOperationServlet() {
        super();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String Operation = request.getParameter("operation");
		
		if(Operation.trim().equals("addCategory"))
		{
			String CategoryTitle = request.getParameter("catTitle");
			String CategoryDescription = request.getParameter("catDescription");
			
			Category category = new Category();
			category.setCategoryTitle(CategoryTitle);
			category.setCategoryDescription(CategoryDescription);
			
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
			int CategotyId = categoryDao.saveCategory(category);
			
			session.setAttribute("message", CategoryTitle+" category saved saccessfully... as a ID : "+CategotyId);
			response.sendRedirect("AdminPage.jsp");
			return;
			
		}
		else if(Operation.trim().equals("addProduct"))
		{
			
			String productTitle = request.getParameter("productTitle");
			String productDescription = request.getParameter("productDescription");
			int productPrice = Integer.parseInt(request.getParameter("productPrice"));
			int productDiscount = Integer.parseInt(request.getParameter("productDiscount"));
			int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
			int catId = Integer.parseInt(request.getParameter("catId"));
			Part part = request.getPart("productPicture");
			
			Product product = new Product();
			product.setpName(productTitle);
			product.setpDescription(productDescription);
			product.setpPrice(productPrice);
			product.setpDiscount(productDiscount);
			product.setpQuantity(productQuantity);
			product.setpPhoto(part.getSubmittedFileName());
			
			CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
			Category categoryById = categoryDao.getCategoryById(catId);
			
			product.setCategory(categoryById);
			
			ProductDao productDao = new ProductDao(FactoryProvider.getFactory());
			productDao.saveProduct(product);
			
			String path =  request.getRealPath("Images")+File.separator+"Products"+File.separator+part.getSubmittedFileName();
			System.out.println(path);
			
			try {
				FileOutputStream fileOutputStream = new FileOutputStream(path);
				InputStream inputStream = part.getInputStream();
				byte[] data = new byte[inputStream.available()];
				inputStream.read(data);
				fileOutputStream.write(data);
				fileOutputStream.close();
				
			} catch (Exception e) {
				e.printStackTrace();
				
			}
			
			
			
			session.setAttribute("message", productTitle+" product saved saccessfully...");
			response.sendRedirect("AdminPage.jsp");
			return;

		
		
		
		
		
		}
		
		
		
		
		
		
		
		
		
		
		
		

	}

}
