/**
 * Phoenix LiveView Hooks for Supabase UI components
 */

// Scroll behavior for chat components
const ScrollToBottom = {
  mounted() {
    this.scrollToBottom();
    this.observer = new MutationObserver(() => this.scrollToBottom());
    this.observer.observe(this.el, { childList: true, subtree: true });
  },

  updated() {
    this.scrollToBottom();
  },

  beforeDestroy() {
    if (this.observer) {
      this.observer.disconnect();
    }
  },

  scrollToBottom() {
    this.el.scrollTop = this.el.scrollHeight;
  }
};

// File upload dropzone functionality
const Dropzone = {
  mounted() {
    const targetId = this.el.dataset.uploadTarget;
    const fileInput = document.getElementById(targetId);
    const form = document.getElementById(`${targetId}-form`);

    if (!fileInput || !form) return;

    // Handle click to open file dialog
    this.el.addEventListener('click', (e) => {
      if (e.target.tagName !== 'BUTTON' && e.target.tagName !== 'A' && e.target.tagName !== 'INPUT') {
        e.preventDefault();
        fileInput.click();
      }
    });

    // Handle drag and drop events
    this.el.addEventListener('dragover', (e) => {
      e.preventDefault();
      this.el.classList.add('bg-muted/50');
    });

    this.el.addEventListener('dragleave', (e) => {
      e.preventDefault();
      this.el.classList.remove('bg-muted/50');
    });

    this.el.addEventListener('drop', (e) => {
      e.preventDefault();
      this.el.classList.remove('bg-muted/50');
      
      if (e.dataTransfer.files.length > 0) {
        const files = e.dataTransfer.files;
        
        // Create a new DataTransfer object
        const dataTransfer = new DataTransfer();
        
        // Add files to the DataTransfer object
        for (let i = 0; i < files.length; i++) {
          dataTransfer.items.add(files[i]);
        }
        
        // Set the files to the file input
        fileInput.files = dataTransfer.files;
        
        // Trigger change event
        fileInput.dispatchEvent(new Event('change', { bubbles: true }));
      }
    });
  }
};

// Realtime cursor tracking and visualization
const RealtimeCursors = {
  mounted() {
    this.throttleMs = 50;
    this.lastSent = 0;
    
    this.handleMouseMove = this.throttle((e) => {
      const rect = this.el.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;
      
      if (x >= 0 && y >= 0 && x <= rect.width && y <= rect.height) {
        this.pushEvent('cursor_move', { x, y });
      }
    }, this.throttleMs);
    
    this.el.addEventListener('mousemove', this.handleMouseMove);
    
    // Initially position cursors based on data-cursors
    try {
      const cursors = JSON.parse(this.el.dataset.cursors || '{}');
      Object.entries(cursors).forEach(([userId, cursor]) => {
        this.updateCursorPosition(userId, cursor);
      });
    } catch (error) {
      console.error('Error parsing cursor data:', error);
    }
  },
  
  updated() {
    try {
      const cursors = JSON.parse(this.el.dataset.cursors || '{}');
      Object.entries(cursors).forEach(([userId, cursor]) => {
        this.updateCursorPosition(userId, cursor);
      });
    } catch (error) {
      console.error('Error parsing cursor data:', error);
    }
  },
  
  beforeDestroy() {
    this.el.removeEventListener('mousemove', this.handleMouseMove);
  },
  
  updateCursorPosition(userId, cursor) {
    const cursorEl = document.getElementById(`cursor-${userId}`);
    if (cursorEl && cursor.x !== undefined && cursor.y !== undefined) {
      cursorEl.style.left = `${cursor.x}px`;
      cursorEl.style.top = `${cursor.y}px`;
    }
  },
  
  throttle(func, limit) {
    return (...args) => {
      const now = Date.now();
      if (now - this.lastSent >= limit) {
        this.lastSent = now;
        func(...args);
      }
    };
  }
};

export default {
  ScrollToBottom,
  Dropzone,
  RealtimeCursors
};