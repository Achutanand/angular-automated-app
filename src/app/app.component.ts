import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule],
  template: `
    <div class="container">
      <div class="card">
        <h1>🚀 Angular 20.3.12 Automated App</h1>
        <p>Fully automated deployment with Ansible and Azure!</p>
        
        <div class="features">
          <h2>✨ Features</h2>
          <ul>
            <li>Angular 20.3.12</li>
            <li>Docker containerization</li>
            <li>GitHub Actions CI/CD</li>
            <li>Ansible Infrastructure as Code</li>
            <li>Azure App Service deployment</li>
            <li>Zero manual Azure Portal work</li>
          </ul>
        </div>

        <div class="status">
          <h2>📊 Status</h2>
          <p>Environment: {{ environment }}</p>
          <p>Version: {{ version }}</p>
          <p>Build Time: {{ buildTime }}</p>
        </div>

        <button class="btn" (click)="refresh()">
          Refresh Status
        </button>
      </div>
    </div>
  `,
  styles: [`
    h1 {
      color: #333;
      margin-bottom: 1rem;
    }
    
    h2 {
      color: #667eea;
      margin: 1rem 0 0.5rem 0;
    }
    
    ul {
      margin: 0.5rem 0;
      padding-left: 1.5rem;
    }
    
    li {
      margin: 0.25rem 0;
    }
    
    .features, .status {
      margin: 1.5rem 0;
    }
  `]
})
export class AppComponent {
  environment = 'production';
  version = '1.0.0';
  buildTime = new Date().toISOString();

  refresh() {
    this.buildTime = new Date().toISOString();
  }
}