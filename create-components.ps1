# Script para crear 5 componentes de portfolio en Astro
# Ejecutar desde la raíz del proyecto: .\create-components.ps1

Write-Host "🚀 Creando componentes para tu portfolio..." -ForegroundColor Green

# Crear directorio de componentes si no existe
$componentsDir = "src\components"
if (!(Test-Path $componentsDir)) {
    New-Item -ItemType Directory -Path $componentsDir -Force
    Write-Host "✅ Directorio de componentes creado" -ForegroundColor Yellow
}

# 1. Header Component
Write-Host "📝 Creando Header.astro..." -ForegroundColor Cyan
$headerContent = @"
---
// Header component for portfolio
---

<header class="header">
    <nav class="nav">
        <div class="nav-brand">
            <a href="/" class="brand-link">Jacquelina</a>
        </div>
        <ul class="nav-menu">
            <li><a href="#about">Sobre mí</a></li>
            <li><a href="#projects">Proyectos</a></li>
            <li><a href="#skills">Habilidades</a></li>
            <li><a href="#contact">Contacto</a></li>
        </ul>
    </nav>
</header>

<style>
    .header {
        position: fixed;
        top: 0;
        width: 100%;
        background: rgba(255, 255, 255, 0.95);
        backdrop-filter: blur(10px);
        z-index: 1000;
        padding: 1rem 0;
    }
    
    .nav {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 2rem;
    }
    
    .brand-link {
        font-size: 1.5rem;
        font-weight: bold;
        text-decoration: none;
        color: #333;
    }
    
    .nav-menu {
        display: flex;
        list-style: none;
        gap: 2rem;
        margin: 0;
        padding: 0;
    }
    
    .nav-menu a {
        text-decoration: none;
        color: #333;
        transition: color 0.3s ease;
    }
    
    .nav-menu a:hover {
        color: #007bff;
    }
</style>
"@
Set-Content -Path "$componentsDir\Header.astro" -Value $headerContent

# 2. Hero Section Component
Write-Host "📝 Creando Hero.astro..." -ForegroundColor Cyan
$heroContent = @"
---
// Hero section component
---

<section class="hero">
    <div class="hero-content">
        <h1 class="hero-title">Hola, soy Jacquelina</h1>
        <p class="hero-subtitle">Desarrolladora Full Stack apasionada por crear experiencias digitales únicas</p>
        <div class="hero-buttons">
            <a href="#projects" class="btn btn-primary">Ver Proyectos</a>
            <a href="#contact" class="btn btn-secondary">Contactar</a>
        </div>
    </div>
    <div class="hero-image">
        <!-- Aquí puedes agregar tu foto o ilustración -->
        <div class="placeholder-image">👩‍💻</div>
    </div>
</section>

<style>
    .hero {
        min-height: 100vh;
        display: flex;
        align-items: center;
        padding: 2rem;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: white;
    }
    
    .hero-content {
        flex: 1;
        max-width: 600px;
    }
    
    .hero-title {
        font-size: 3.5rem;
        font-weight: bold;
        margin-bottom: 1rem;
        line-height: 1.2;
    }
    
    .hero-subtitle {
        font-size: 1.25rem;
        margin-bottom: 2rem;
        opacity: 0.9;
    }
    
    .hero-buttons {
        display: flex;
        gap: 1rem;
        flex-wrap: wrap;
    }
    
    .btn {
        padding: 0.75rem 1.5rem;
        border-radius: 50px;
        text-decoration: none;
        font-weight: 500;
        transition: transform 0.3s ease;
    }
    
    .btn:hover {
        transform: translateY(-2px);
    }
    
    .btn-primary {
        background: #007bff;
        color: white;
    }
    
    .btn-secondary {
        background: transparent;
        color: white;
        border: 2px solid white;
    }
    
    .hero-image {
        flex: 1;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    
    .placeholder-image {
        font-size: 8rem;
        opacity: 0.8;
    }
    
    @media (max-width: 768px) {
        .hero {
            flex-direction: column;
            text-align: center;
        }
        
        .hero-title {
            font-size: 2.5rem;
        }
    }
</style>
"@
Set-Content -Path "$componentsDir\Hero.astro" -Value $heroContent

# 3. Project Card Component
Write-Host "📝 Creando ProjectCard.astro..." -ForegroundColor Cyan
$projectCardContent = @"
---
export interface Props {
    title: string;
    description: string;
    technologies: string[];
    imageUrl?: string;
    liveUrl?: string;
    githubUrl?: string;
}

const { title, description, technologies, imageUrl, liveUrl, githubUrl } = Astro.props;
---

<div class="project-card">
    <div class="project-image">
        {imageUrl ? (
            <img src={imageUrl} alt={title} />
        ) : (
            <div class="placeholder-project">📱</div>
        )}
    </div>
    <div class="project-content">
        <h3 class="project-title">{title}</h3>
        <p class="project-description">{description}</p>
        <div class="project-technologies">
            {technologies.map((tech) => (
                <span class="tech-tag">{tech}</span>
            ))}
        </div>
        <div class="project-links">
            {liveUrl && (
                <a href={liveUrl} class="project-link" target="_blank" rel="noopener">
                    🌐 Ver Demo
                </a>
            )}
            {githubUrl && (
                <a href={githubUrl} class="project-link" target="_blank" rel="noopener">
                    📂 Código
                </a>
            )}
        </div>
    </div>
</div>

<style>
    .project-card {
        background: white;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    
    .project-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
    }
    
    .project-image {
        height: 200px;
        background: #f8f9fa;
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }
    
    .project-image img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    
    .placeholder-project {
        font-size: 4rem;
        opacity: 0.5;
    }
    
    .project-content {
        padding: 1.5rem;
    }
    
    .project-title {
        font-size: 1.25rem;
        font-weight: bold;
        margin-bottom: 0.5rem;
        color: #333;
    }
    
    .project-description {
        color: #666;
        margin-bottom: 1rem;
        line-height: 1.6;
    }
    
    .project-technologies {
        display: flex;
        flex-wrap: wrap;
        gap: 0.5rem;
        margin-bottom: 1rem;
    }
    
    .tech-tag {
        background: #e9ecef;
        color: #495057;
        padding: 0.25rem 0.75rem;
        border-radius: 20px;
        font-size: 0.875rem;
    }
    
    .project-links {
        display: flex;
        gap: 1rem;
    }
    
    .project-link {
        text-decoration: none;
        color: #007bff;
        font-weight: 500;
        transition: color 0.3s ease;
    }
    
    .project-link:hover {
        color: #0056b3;
    }
</style>
"@
Set-Content -Path "$componentsDir\ProjectCard.astro" -Value $projectCardContent

# 4. Skills Section Component
Write-Host "📝 Creando Skills.astro..." -ForegroundColor Cyan
$skillsContent = @"
---
// Skills section component
---

<section id="skills" class="skills">
    <div class="container">
        <h2 class="section-title">Mis Habilidades</h2>
        <div class="skills-grid">
            <div class="skill-category">
                <h3 class="category-title">Frontend</h3>
                <div class="skill-items">
                    <div class="skill-item">
                        <span class="skill-name">HTML5</span>
                        <div class="skill-bar">
                            <div class="skill-progress" style="width: 95%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">CSS3</span>
                        <div class="skill-bar">
                            <div class="skill-progress" style="width: 90%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">JavaScript</span>
                        <div class="skill-bar">
                            <div class="skill-progress" style="width: 85%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">React</span>
                        <div class="skill-bar">
                            <div class="skill-progress" style="width: 80%"></div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="skill-category">
                <h3 class="category-title">Backend</h3>
                <div class="skill-items">
                    <div class="skill-item">
                        <span class="skill-name">Node.js</span>
                        <div class="skill-bar">
                            <div class="skill-progress" style="width: 75%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">PHP</span>
                        <div class="skill-bar">
                            <div class="skill-progress" style="width: 70%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">MySQL</span>
                        <div class="skill-bar">
                            <div class="skill-progress" style="width: 65%"></div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="skill-category">
                <h3 class="category-title">Herramientas</h3>
                <div class="skill-items">
                    <div class="skill-item">
                        <span class="skill-name">Git</span>
                        <div class="skill-bar">
                            <div class="skill-progress" style="width: 85%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">Figma</span>
                        <div class="skill-bar">
                            <div class="skill-progress" style="width: 70%"></div>
                        </div>
                    </div>
                    <div class="skill-item">
                        <span class="skill-name">VS Code</span>
                        <div class="skill-bar">
                            <div class="skill-progress" style="width: 90%"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<style>
    .skills {
        padding: 5rem 2rem;
        background: #f8f9fa;
    }
    
    .container {
        max-width: 1200px;
        margin: 0 auto;
    }
    
    .section-title {
        text-align: center;
        font-size: 2.5rem;
        font-weight: bold;
        margin-bottom: 3rem;
        color: #333;
    }
    
    .skills-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 2rem;
    }
    
    .skill-category {
        background: white;
        padding: 2rem;
        border-radius: 12px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    
    .category-title {
        font-size: 1.5rem;
        font-weight: bold;
        margin-bottom: 1.5rem;
        color: #333;
        text-align: center;
    }
    
    .skill-items {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }
    
    .skill-item {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
    }
    
    .skill-name {
        font-weight: 500;
        color: #555;
    }
    
    .skill-bar {
        height: 8px;
        background: #e9ecef;
        border-radius: 4px;
        overflow: hidden;
    }
    
    .skill-progress {
        height: 100%;
        background: linear-gradient(90deg, #007bff, #0056b3);
        border-radius: 4px;
        transition: width 1s ease;
    }
</style>
"@
Set-Content -Path "$componentsDir\Skills.astro" -Value $skillsContent

# 5. Contact Form Component
Write-Host "📝 Creando ContactForm.astro..." -ForegroundColor Cyan
$contactFormContent = @"
---
// Contact form component
---

<section id="contact" class="contact">
    <div class="container">
        <h2 class="section-title">Contáctame</h2>
        <div class="contact-content">
            <div class="contact-info">
                <h3>¡Hablemos!</h3>
                <p>¿Tienes un proyecto en mente? ¿Quieres colaborar? ¡Me encantaría escuchar de ti!</p>
                <div class="contact-details">
                    <div class="contact-item">
                        <span class="contact-icon">📧</span>
                        <span>jacquelina@email.com</span>
                    </div>
                    <div class="contact-item">
                        <span class="contact-icon">📱</span>
                        <span>+1 (555) 123-4567</span>
                    </div>
                    <div class="contact-item">
                        <span class="contact-icon">📍</span>
                        <span>Ciudad, País</span>
                    </div>
                </div>
            </div>
            
            <form class="contact-form" id="contactForm">
                <div class="form-group">
                    <label for="name">Nombre</label>
                    <input type="text" id="name" name="name" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="subject">Asunto</label>
                    <input type="text" id="subject" name="subject" required>
                </div>
                
                <div class="form-group">
                    <label for="message">Mensaje</label>
                    <textarea id="message" name="message" rows="5" required></textarea>
                </div>
                
                <button type="submit" class="submit-btn">Enviar Mensaje</button>
            </form>
        </div>
    </div>
</section>

<style>
    .contact {
        padding: 5rem 2rem;
        background: white;
    }
    
    .container {
        max-width: 1200px;
        margin: 0 auto;
    }
    
    .section-title {
        text-align: center;
        font-size: 2.5rem;
        font-weight: bold;
        margin-bottom: 3rem;
        color: #333;
    }
    
    .contact-content {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 4rem;
        align-items: start;
    }
    
    .contact-info h3 {
        font-size: 1.75rem;
        font-weight: bold;
        margin-bottom: 1rem;
        color: #333;
    }
    
    .contact-info p {
        color: #666;
        line-height: 1.6;
        margin-bottom: 2rem;
    }
    
    .contact-details {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }
    
    .contact-item {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        color: #555;
    }
    
    .contact-icon {
        font-size: 1.25rem;
    }
    
    .contact-form {
        background: #f8f9fa;
        padding: 2rem;
        border-radius: 12px;
    }
    
    .form-group {
        margin-bottom: 1.5rem;
    }
    
    .form-group label {
        display: block;
        margin-bottom: 0.5rem;
        font-weight: 500;
        color: #333;
    }
    
    .form-group input,
    .form-group textarea {
        width: 100%;
        padding: 0.75rem;
        border: 2px solid #e9ecef;
        border-radius: 8px;
        font-size: 1rem;
        transition: border-color 0.3s ease;
    }
    
    .form-group input:focus,
    .form-group textarea:focus {
        outline: none;
        border-color: #007bff;
    }
    
    .submit-btn {
        width: 100%;
        padding: 1rem;
        background: #007bff;
        color: white;
        border: none;
        border-radius: 8px;
        font-size: 1rem;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    
    .submit-btn:hover {
        background: #0056b3;
    }
    
    @media (max-width: 768px) {
        .contact-content {
            grid-template-columns: 1fr;
            gap: 2rem;
        }
    }
</style>

<script>
    document.getElementById('contactForm').addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Aquí puedes agregar la lógica para enviar el formulario
        alert('¡Gracias por tu mensaje! Te responderé pronto.');
        
        // Limpiar el formulario
        this.reset();
    });
</script>
"@
Set-Content -Path "$componentsDir\ContactForm.astro" -Value $contactFormContent

Write-Host "✅ ¡Componentes creados exitosamente!" -ForegroundColor Green
Write-Host "📁 Componentes creados en: $componentsDir" -ForegroundColor Yellow
Write-Host ""
Write-Host "📋 Lista de componentes:" -ForegroundColor Cyan
Write-Host "   • Header.astro - Navegación principal" -ForegroundColor White
Write-Host "   • Hero.astro - Sección de bienvenida" -ForegroundColor White
Write-Host "   • ProjectCard.astro - Tarjeta de proyecto" -ForegroundColor White
Write-Host "   • Skills.astro - Sección de habilidades" -ForegroundColor White
Write-Host "   • ContactForm.astro - Formulario de contacto" -ForegroundColor White
Write-Host ""
Write-Host "🚀 Para usar los componentes, impórtalos en tus páginas .astro:" -ForegroundColor Cyan
Write-Host "   import Header from '../components/Header.astro';" -ForegroundColor White
Write-Host ""
Write-Host "💡 Recuerda personalizar los componentes según tus necesidades!" -ForegroundColor Yellow






