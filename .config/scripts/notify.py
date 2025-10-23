import tkinter as tk
import sys

def create_notification(title, message):
    root = tk.Tk()
    root.overrideredirect(True)
    root.attributes("-topmost", True)
    root.attributes("-alpha", 0.95)  # Slight transparency
    
    # Get screen dimensions
    screen_width = root.winfo_screenwidth()
    screen_height = root.winfo_screenheight()
    
    # Set position to bottom-right corner with offset
    window_width = 320
    window_height = 120
    x_position = screen_width - window_width - 20
    y_position = screen_height - window_height - 60
    root.geometry(f"{window_width}x{window_height}+{x_position}+{y_position}")
    
    # Main container with padding for rounded effect
    container = tk.Frame(root, bg="#1e1e2e", highlightthickness=0)
    container.pack(fill="both", expand=True)
    
    # Title
    title_label = tk.Label(
        container, 
        text=title, 
        bg="#1e1e2e", 
        fg="#cdd6f4", 
        font=("Segoe UI", 11, "bold"),
        anchor="w"
    )
    title_label.pack(fill="x", padx=15, pady=(15, 5))
    
    # Message
    message_label = tk.Label(
        container, 
        text=message, 
        bg="#1e1e2e", 
        fg="#a6adc8", 
        font=("Segoe UI", 9),
        justify="left",
        wraplength=window_width-30,
        anchor="w"
    )
    message_label.pack(fill="both", expand=True, padx=15, pady=(0, 15))
    
    # Accent border (left side)
    accent = tk.Frame(root, bg="#89b4fa", width=4)
    accent.place(x=0, y=0, relheight=1)
    
    # Fade out animation
    def fade_out(alpha=0.95):
        if alpha > 0:
            root.attributes("-alpha", alpha)
            root.after(50, lambda: fade_out(alpha - 0.05))
        else:
            root.destroy()
    
    # Close on click
    def close_notification(event=None):
        fade_out()
    
    root.bind("<Button-1>", close_notification)
    container.bind("<Button-1>", close_notification)
    title_label.bind("<Button-1>", close_notification)
    message_label.bind("<Button-1>", close_notification)
    
    # Auto-close after 4 seconds, then fade out
    root.after(4000, fade_out)
    
    root.mainloop()

if __name__ == "__main__":
    if len(sys.argv) > 2:
        title = sys.argv[1]
        message = " ".join(sys.argv[2:])
    else:
        title = "Notification"
        message = "Default message."
    
    create_notification(title, message)