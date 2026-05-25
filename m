<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biotech Professional Portfolio</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    
    <style>
        /* --- Root Variables & Themes --- */
        :root {
            --bg-color: #0a0f1d;
            --card-bg: #131c31;
            --accent-green: #00ffcc;
            --accent-blue: #0077ff;
            --text-main: #ffffff;
            --text-muted: #8fa0dd;
            --font-tech: 'Orbitron', sans-serif;
            --font-body: 'Roboto', sans-serif;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            scroll-behavior: smooth;
        }

        body {
            background-color: var(--bg-color);
            color: var(--text-main);
            font-family: var(--font-body);
            overflow-x: hidden;
        }

        /* --- Custom Scrollbar --- */
        ::-webkit-scrollbar {
            width: 8px;
        }
        ::-webkit-scrollbar-track {
            background: var(--bg-color);
        }
        ::-webkit-scrollbar-thumb {
            background: var(--accent-green);
            border-radius: 4px;
        }

        /* --- Background Canvas for DNA Animation --- */
        #dna-canvas {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            z-index: -1;
            opacity: 0.15;
            pointer-events: none;
        }

        /* --- Header & Navigation --- */
        header {
            position: fixed;
            top: 0;
            width: 100%;
            background: rgba(10, 15, 29, 0.9);
            backdrop-filter: blur(10px);
            z-index: 1000;
            border-bottom: 1px solid rgba(0, 255, 204, 0.1);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
        }

        .logo {
            font-family: var(--font-tech);
            font-size: 1.5rem;
            color: var(--accent-green);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 30px;
        }

        .nav-links a {
            color: var(--text-muted);
            text-decoration: none;
            font-family: var(--font-tech);
            font-size: 0.9rem;
            transition: 0.3s;
        }

        .nav-links a:hover, .nav-links a.active {
            color: var(--accent-green);
            text-shadow: 0 0 10px var(--accent-green);
        }

        /* --- Hero Section --- */
        .hero {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 0 20px;
            position: relative;
        }

        .hero-content h1 {
            font-family: var(--font-tech);
            font-size: 3.5rem;
            margin-bottom: 10px;
            letter-spacing: 2px;
        }

        .hero-content h1 span {
            color: var(--accent-green);
            text-shadow: 0 0 20px rgba(0, 255, 204, 0.5);
        }

        .hero-content h2 {
            font-size: 1.8rem;
            color: var(--text-muted);
            margin-bottom: 30px;
            font-weight: 300;
        }
.btn {
            display: inline-block;
            padding: 12px 30px;
            border: 2px solid var(--accent-green);
            color: var(--accent-green);
            font-family: var(--font-tech);
            text-decoration: none;
            border-radius: 5px;
            transition: 0.4s;
            background: transparent;
            cursor: pointer;
        }

        .btn:hover {
            background: var(--accent-green);
            color: var(--bg-color);
            box-shadow: 0 0 20px var(--accent-green);
            font-weight: bold;
        }

        /* --- Global Sections Layout --- */
        section {
            padding: 100px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-title {
            font-family: var(--font-tech);
            font-size: 2.2rem;
            text-align: center;
            margin-bottom: 60px;
            position: relative;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 70px;
            height: 3px;
            background: linear-gradient(90deg, var(--accent-blue), var(--accent-green));
        }

        /* --- About & Skills Section --- */
        .about-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 50px;
            align-items: center;
        }

        .about-text p {
            font-size: 1.1rem;
            line-height: 1.8;
            color: var(--text-muted);
            margin-bottom: 20px;
        }

        .skills-container {
            background: var(--card-bg);
            padding: 30px;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.05);
        }

        .skill-bar {
            margin-bottom: 20px;
        }

        .skill-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-family: var(--font-tech);
            font-size: 0.85rem;
        }

        .progress-line {
            height: 6px;
            background: #0d1424;
            border-radius: 10px;
            position: relative;
        }

        .progress-line span {
            height: 100%;
            background: linear-gradient(90deg, var(--accent-blue), var(--accent-green));
            position: absolute;
            border-radius: 10px;
            width: 0;
            transition: width 1.5s cubic-bezier(1,0,0,1);
        }

        /* --- Timeline / Experience --- */
        .timeline {
            position: relative;
            max-width: 800px;
            margin: 0 auto;
        }

        .timeline::after {
            content: '';
            position: absolute;
            width: 2px;
            background: var(--accent-blue);
            top: 0;
            bottom: 0;
            left: 50%;
            margin-left: -1px;
        }

        .timeline-item {
            padding: 10px 40px;
            position: relative;
            width: 50%;
        }

        .timeline-item::after {
            content: '🧬';
            position: absolute;
            width: 20px;
            height: 20px;
            right: -17px;
            top: 15px;
            background: var(--bg-color);
            z-index: 1;
            font-size: 1.2rem;
        }

        .left { left: 0; }
        .right { left: 50%; }
        .right::after { left: -13px; }

        .timeline-content {
            padding: 20px;
            background: var(--card-bg);
            position: relative;
            border-radius: 8px;
            border-left: 3px solid var(--accent-green);
        }

        .timeline-content h3 {
            font-family: var(--font-tech);
            font-size: 1.1rem;
            color: var(--accent-green);
            margin-bottom: 5px;
        }
.timeline-content span {
            font-size: 0.85rem;
            color: var(--accent-blue);
            display: block;
            margin-bottom: 10px;
        }

        /* --- Projects Section --- */
        .filter-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 40px;
        }

        .filter-btn {
            background: transparent;
            border: 1px solid var(--text-muted);
            color: var(--text-muted);
            padding: 8px 20px;
            font-family: var(--font-tech);
            cursor: pointer;
            border-radius: 20px;
            transition: 0.3s;
        }

        .filter-btn.active, .filter-btn:hover {
            border-color: var(--accent-green);
            color: var(--accent-green);
            background: rgba(0, 255, 204, 0.05);
        }

        .project-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 30px;
        }

        .project-card {
            background: var(--card-bg);
            border-radius: 10px;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.05);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .project-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 255, 204, 0.1);
        }

        .project-img {
            height: 180px;
            background: linear-gradient(135deg, #1f2d4d, #0a0f1d);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
            color: var(--accent-green);
        }

        .project-info {
            padding: 20px;
        }

        .project-info h3 {
            font-family: var(--font-tech);
            font-size: 1.2rem;
            margin-bottom: 10px;
        }

        .project-info p {
            color: var(--text-muted);
            font-size: 0.9rem;
            line-height: 1.5;
            margin-bottom: 15px;
        }

        .project-tags {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .project-tags span {
            font-size: 0.75rem;
            background: rgba(0, 119, 255, 0.2);
            color: var(--accent-blue);
            padding: 3px 8px;
            border-radius: 4px;
        }

        /* --- Contact Section --- */
        .contact-container {
            max-width: 600px;
            margin: 0 auto;
            background: var(--card-bg);
            padding: 40px;
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.05);
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group input, .form-group textarea {
            width: 100%;
            padding: 12px;
            background: var(--bg-color);
            border: 1px solid rgba(255, 255, 255, 0.1);
            color: white;
            border-radius: 5px;
            outline: none;
            transition: 0.3s;
        }

        .form-group input:focus, .form-group textarea:focus {
            border-color: var(--accent-green);
            box-shadow: 0 0 10px rgba(0, 255, 204, 0.2);
        }

        footer {
            text-align: center;
            padding: 40px 20px;
            color: var(--text-muted);
            font-size: 0.9rem;
            border-top: 1px solid rgba(255, 255, 255, 0.05);
        }

        /* --- Responsive Design --- */
        @media (max-width: 768px) {
            .about-grid { grid-template-columns: 1fr; }
            .timeline::after { left: 31px; }
            .timeline-item { width: 100%; padding-left: 70px; padding-right: 25px; }
            .timeline-item.right { left: 0; }
            .timeline-item::after { left: 15px; }
            .nav-links { display: none; } /* يمكن إضافة قائمة برجر برمجياً لاحقاً */
            .hero-content h1 { font-size: 2.3rem; }
        }
    </style>
</head>
<body>
    <canvas id="dna-canvas"></canvas>

    <header>
        <div class="nav-container">
            <a href="#" class="logo"><i class="fa-solid fa-dna"></i> Biotech.AI</a>
            <ul class="nav-links">
                <li><a href="#about" class="nav-item">About</a></li>
                <li><a href="#experience" class="nav-item">Experience</a></li>
                <li><a href="#projects" class="nav-item">Research</a></li>
                <li><a href="#contact" class="nav-item">Contact</a></li>
            </ul>
        </div>
    </header>

    <section class="hero">
        <div class="hero-content">
            <h1>Hi, I'm <span id="typing-name">Alex Carter</span></h1>
            <h2>Biotechnology Student & Researcher</h2>
            <p style="color: var(--text-muted); margin-bottom: 30px; max-width: 600px; margin-left: auto; margin-right: auto;">
                Bridging the gap between Biological Systems and Computational Data to engineer the solutions of tomorrow.
            </p>
            <a href="#projects" class="btn">Explore My Work</a>
        </div>
    </section>

    <section id="about">
        <h2 class="section-title">About & Core Skills</h2>
        <div class="about-grid">
            <div class="about-text">
                <p>I am a passionate Biotechnology student deeply invested in Molecular Biology, Genetic Engineering, and Bioinformatics. My academic journey is driven by solving complex biological problems using cutting-edge computational tools.</p>
                <p>I thrive in wet lab environments as much as I do writing scripts to analyze genomic data. Looking for opportunities to contribute to innovative therapeutic research.</p>
                <a href="#" class="btn" style="padding: 8px 20px; font-size: 0.85rem;"><i class="fa-solid fa-file-pdf"></i> Download CV</a>
            </div>
            <div class="skills-container">
                <div class="skill-bar">
                    <div class="skill-info"><span>Molecular Cloning & PCR</span><span>90%</span></div>
                    <div class="progress-line"><span data-width="90%"></span></div>
                </div>
                <div class="skill-bar">
                    <div class="skill-info"><span>Bioinformatics (BLAST, Biopython)</span><span>85%</span></div>
                    <div class="progress-line"><span data-width="85%"></span></div>
                </div>
                <div class="skill-bar">
                    <div class="skill-info"><span>CRISPR/Cas9 Design</span><span>75%</span></div>
                    <div class="progress-line"><span data-width="75%"></span></div>
                </div>
                <div class="skill-bar">
                    <div class="skill-info"><span>Python & R Data Analysis</span><span>80%</span></div>
                    <div class="progress-line"><span data-width="80%"></span></div>
                </div>
            </div>
        </div>
    </section>

    <section id="experience" style="background: rgba(19, 28, 49, 0.3);">
        <h2 class="section-title">Academic Timeline</h2>
        <div class="timeline">
            <div class="timeline-item left">
                <div class="timeline-content">
                    <h3>Research Intern</h3>
                    <span>Genetics Lab Co. | Summer 2025</span>
                    <p>Assisted in CRISPR-based gene editing pipelines and optimization of transformation protocols in plant tissues.</p>
                </div>
            </div>
            <div class="timeline-item right">
                <div class="timeline-content">
                    <h3>Undergraduate Student</h3>
                    <span>Tech University | 2023 - Present</span>
                    <p>Majoring in Biotechnology with a focus on Computational Biology. Maintaining a 3.9 GPA.</p>
</div>
            </div>
            <div class="timeline-item left">
                <div class="timeline-content">
                    <h3>Lead Volunteer</h3>
                    <span>Bio-Informatics Workshop | Jan 2024</span>
                    <p>Organized a university-wide boot camp teaching Python libraries tailored for sequence alignment data analysis.</p>
                </div>
            </div>
        </div>
    </section>

    <section id="projects">
        <h2 class="section-title">Featured Research & Projects</h2>
        
        <div class="filter-buttons">
            <button class="filter-btn active" data-filter="all">All</button>
            <button class="filter-btn" data-filter="wet-lab">Wet Lab</button>
            <button class="filter-btn" data-filter="bioinfo">Bioinformatics</button>
        </div>

        <div class="project-grid">
            <div class="project-card" data-category="bioinfo">
                <div class="project-img"><i class="fa-solid fa-microchip"></i></div>
                <div class="project-info">
                    <h3>COVID-19 Mutation Tracker</h3>
                    <p>A Python script that fetches NCBI data automatically and visualizes structural variations in spike proteins.</p>
                    <div class="project-tags"><span>Python</span><span>Biopython</span><span>DataViz</span></div>
                </div>
            </div>
            <div class="project-card" data-category="wet-lab">
                <div class="project-img"><i class="fa-solid fa-flask-vial"></i></div>
                <div class="project-info">
                    <h3>E. coli GFP Transformation</h3>
                    <p>Optimized green fluorescent protein expression under specific promoter constraints, boosting yields by 15%.</p>
                    <div class="project-tags"><span>Cloning</span><span>Expression</span><span>WetLab</span></div>
                </div>
            </div>
            <div class="project-card" data-category="bioinfo">
                <div class="project-img"><i class="fa-solid fa-chart-network"></i></div>
                <div class="project-info">
                    <h3>Metabolic Pathway Analysis</h3>
                    <p>Utilized R programming to build predictive models for secondary metabolite pathways in industrial yeast strains.</p>
                    <div class="project-tags"><span>R Lang</span><span>SystemsBio</span></div>
                </div>
            </div>
        </div>
    </section>

    <section id="contact">
        <h2 class="section-title">Get In Touch</h2>
        <div class="contact-container">
            <form id="contact-form">
                <div class="form-group">
                    <input type="text" id="name" placeholder="Your Name" required>
                </div>
                <div class="form-group">
                    <input type="email" id="email" placeholder="Your Email" required>
                </div>
                <div class="form-group">
                    <textarea id="message" rows="5" placeholder="Your Message or Collaboration Proposal" required></textarea>
                </div>
                <button type="submit" class="btn" style="width: 100%;">Send Diagnostic Message</button>
            </form>
        </div>
    </section>

    <footer>
        <p>&copy; 2026 Biotech Portfolio. Designed with Molecular Precision.</p>
    </footer>

    <script>
        // 1. DNA Background Animation (HTML Canvas)
        const canvas = document.getElementById('dna-canvas');
        const ctx = canvas.getContext('2d');

        let width = canvas.width = window.innerWidth;
        let height = canvas.height = window.innerHeight;

        window.addEventListener('resize', () => {
            width = canvas.width = window.innerWidth;
            height = canvas.height = window.innerHeight;
        });

        let count = 50;
        let speed = 0.03;
        let phase = 0;
function drawDNA() {
            ctx.clearRect(0, 0, width, height);
            
            let centerX = width / 2;
            let radius = 60;

            for (let i = 0; i < count; i++) {
                let y = (height / count) * i;
                let angle = phase + (i * 0.2);
                
                // Strand 1
                let x1 = centerX + Math.sin(angle) * radius;
                // Strand 2
                let x2 = centerX + Math.sin(angle + Math.PI) * radius;

                // Draw Connecting Bonds
                ctx.beginPath();
                ctx.moveTo(x1, y);
                ctx.lineTo(x2, y);
                ctx.strokeStyle = 'rgba(0, 119, 255, 0.2)';
                ctx.lineWidth = 2;
                ctx.stroke();

                // Draw Base Nodes
                ctx.beginPath();
                ctx.arc(x1, y, 4, 0, Math.PI * 2);
                ctx.fillStyle = '#00ffcc';
                ctx.fill();

                ctx.beginPath();
                ctx.arc(x2, y, 4, 0, Math.PI * 2);
                ctx.fillStyle = '#0077ff';
                ctx.fill();
            }
            phase += speed;
            requestAnimationFrame(drawDNA);
        }
        drawDNA();

        // 2. Dynamic Project Filter Functionality
        const filterButtons = document.querySelectorAll('.filter-btn');
        const projectCards = document.querySelectorAll('.project-card');

        filterButtons.forEach(button => {
            button.addEventListener('click', () => {
                // Change active button
                filterButtons.forEach(btn => btn.classList.remove('active'));
                button.classList.add('active');

                // Filter logic
                const filterValue = button.getAttribute('data-filter');
                projectCards.forEach(card => {
                    if (filterValue === 'all' || card.getAttribute('data-category') === filterValue) {
                        card.style.display = 'block';
                    } else {
                        card.style.display = 'none';
                    }
                });
            });
        });

        // 3. Skills Progress Bar Animation on Scroll
        const progressSpans = document.querySelectorAll('.progress-line span');
        const skillsSection = document.getElementById('about');

        const animateSkills = () => {
            const sectionPos = skillsSection.getBoundingClientRect().top;
            const screenPos = window.innerHeight / 1.2;

            if (sectionPos < screenPos) {
                progressSpans.forEach(span => {
                    span.style.width = span.getAttribute('data-width');
                });
            }
        };
        window.addEventListener('scroll', animateSkills);

        // 4. Smooth Nav Link Activation
        const sections = document.querySelectorAll('section');
        const navItems = document.querySelectorAll('.nav-item');

        window.addEventListener('scroll', () => {
            let current = '';
            sections.forEach(section => {
                const sectionTop = section.offsetTop;
                if (pageYOffset >= sectionTop - 150) {
                    current = section.getAttribute('id');
                }
            });

            navItems.forEach(item => {
                item.classList.remove('active');
                if (item.getAttribute('href').includes(current)) {
                    item.classList.add('active');
                }
            });
        });

        // 5. Form Submission Simulation
        document.getElementById('contact-form').addEventListener('submit', (e) => {
            e.preventDefault();
            alert('Transmission Successful! Your biological inquiry has been recorded.');
            document.getElementById('contact-form').reset();
        });
    </script>
</body>
</html>
