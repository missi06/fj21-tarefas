package br.com.caelum.tarefas.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.tarefas.dao.UsuarioDao;
import br.com.caelum.tarefas.modelo.Usuario;

@Controller
public class LoginController {	

	@RequestMapping("loginForm")
	public String login() {
		return "formulario-login";
	}
	
	//////
	@RequestMapping("efetuaLogin")
	public String efetua(Usuario usuario, HttpSession session){
		if(new UsuarioDao().existeUsuario(usuario)) {
			session.setAttribute("usuarioLogado", usuario);
			return "menu";
		}
		
		return "redirect:loginForm";
	}
	
	//////
	@RequestMapping("logout")
	public String sair(HttpSession session) {
		session.invalidate();
		return "redirect:loginForm";
	}


}