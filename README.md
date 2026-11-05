# ⚡ Mcsock AI Arsenal — Ultimate Vibe Coding Monorepo 🚀

> *"Every repo I need to vibe code"*  
> Bộ sưu tập tập trung các **Agent Skills**, **MCP Servers**, và **Code Intelligence Tools** tối tân nhất dành cho lập trình viên AI & Vibe Coders (tương thích toàn diện với Google Antigravity, Cursor, Claude Code, Copilot, Codex...).

---

## 🧭 Mục lục

1. [Cấu trúc Monorepo](#-cấu-trúc-monorepo)
2. [Danh mục 14 Vũ khí Vibe Coding](#-danh-mục-14-vũ-khí-vibe-coding)
   - [🧠 1. Agent Skills (Quy tắc & Tư duy)](#1-agent-skills-quy-tắc--tư-duy-lập-trình)
   - [🔌 2. MCP Servers (Giao thức mở rộng)](#2-mcp-servers-giao-thức-mở-rộng-siêu-năng-lực)
   - [🛠️ 3. Tools & Frameworks (Phân tích mã nguồn)](#3-tools--frameworks-phân-tích-mã-nguồn--research)
3. [Hướng dẫn tích hợp vào AI Coding Assistant](#-hướng-dẫn-tích-hợp-vào-ai-coding-assistant)
4. [Tự động đồng bộ từ Upstream](#-tự-động-đồng-bộ-từ-upstream)

---

## 📁 Cấu trúc Monorepo

```text
Mcsock-AI-repo/
├── skills/                     # Bộ kỹ năng, quy tắc & system prompts cho AI Agent
│   ├── karpathy-skills/        # Triết lý code thực dụng của Andrej Karpathy
│   ├── fable-5-skills/         # Bộ 10 kỹ năng kiểm soát kỷ luật hành vi & runtime của Agent
│   ├── ui-ux-pro-max/          # Thiết kế UI/UX đỉnh cao, design tokens & hệ thống màu
│   ├── spec-kit/               # Quy chuẩn đặc tả kỹ thuật trước khi code từ GitHub
│   ├── replica-skills/         # Bộ kỹ năng phân tích, reverse engineer & clone full-stack app
│   ├── universal-modder/       # Kỹ năng refactor & can thiệp AST code đa ngôn ngữ
│   └── mattpocock-skills/      # Bộ kỹ năng lập trình TypeScript & Web chuyên sâu
│
├── mcp-servers/                # Giao thức Model Context Protocol mở rộng cho Agent
│   ├── context7/               # Tra cứu live documentation thư viện chính thức (chống bịa code)
│   ├── chrome-devtools/        # Tự động hóa trình duyệt, test UI, đo lường a11y & Core Web Vitals
│   └── rea/                    # Reverse Engineering Anything (dịch ngược APK, binary, web)
│
├── tools/                      # Công cụ CLI & Framework phân tích mã nguồn
│   ├── graphify/               # Xây dựng đồ thị tri thức (Knowledge Graph AST) cho codebase
│   ├── agent-reach/            # Công cụ cào dữ liệu web, mạng xã hội đa nền tảng cho Agent
│   ├── skillspector/           # NVIDIA SkillSpector: Kiểm định & đánh giá chất lượng Agent Skills
│   └── ponytail/               # Framework quản lý & điều phối workflow của AI Agent
│
├── scripts/
│   └── sync-upstream.ps1       # Script 1-click kéo cập nhật mới nhất từ 14 repo gốc
│
└── README.md
```

---

## 🧰 Danh mục 14 Vũ khí Vibe Coding

### 1. Agent Skills (Quy tắc & Tư duy Lập trình)

| Tên Skill | Nguồn gốc | Vai trò & Mục đích sử dụng |
| :--- | :--- | :--- |
| **`karpathy-skills`** | [multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills) | Triết lý lập trình thực dụng từ Andrej Karpathy: chống over-engineering, thay đổi có phẫu thuật (surgical edits), viết test rõ ràng và luôn xác minh trước khi coi là hoàn thành. |
| **`fable-5-skills`** | [kpab/claude-fable-5-skills](https://github.com/kpab/claude-fable-5-skills) | Bộ 10 Agent Skills kiểm soát hành vi: chống over-planning (`act-when-ready`), chống "vẽ vời" (`no-gold-plating`), chống nói dối tiến độ (`grounded-progress`), ghi nhớ bài học (`markdown-memory`) và tự hành liên tục. |
| **`ui-ux-pro-max`** | [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill) | Kỹ năng thiết kế giao diện UI/UX chuyên nghiệp: phối màu chuẩn WCAG, typography tỷ lệ vàng, responsive layout và tạo dựng Design System hoàn chỉnh. |
| **`spec-kit`** | [github/spec-kit](https://github.com/github/spec-kit) | Specification-Driven Development của GitHub: định nghĩa spec, plan, tasks trước khi viết code để AI không đi lạc hướng hay đoán mò nghiệp vụ. |
| **`replica-skills`** | [Jakeschincariol/replica-skill](https://github.com/Jakeschincariol/replica-skill) | Quy trình bóc tách sản phẩm: lập kế hoạch clone kiến trúc, thiết kế database, tái tạo giao diện và dựng backend tương đương cho một ứng dụng có sẵn. |
| **`universal-modder`** | [rehan-remade/universal-modder](https://github.com/rehan-remade/universal-modder) | Kỹ năng can thiệp và sửa đổi mã nguồn đa ngôn ngữ dựa trên AST, an toàn và hạn chế tối đa sinh side-effect. |
| **`mattpocock-skills`** | [mattpocock/skills](https://github.com/mattpocock/skills) | Bộ skill đỉnh cao dành cho TypeScript, React, Next.js và web development hiện đại từ Matt Pocock. |

---

### 2. MCP Servers (Giao thức Mở rộng Siêu năng lực)

| MCP Server | Nguồn gốc | Sức mạnh bổ sung cho Agent |
| :--- | :--- | :--- |
| **`context7`** | [upstash/context7](https://github.com/upstash/context7) | Kết nối API docs trực tiếp của hơn 1000+ thư viện mới nhất. AI đọc trực tiếp doc thật thay vì nhớ mang máng kiến thức cũ bị quá hạn. |
| **`chrome-devtools`** | [ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) | Cầu nối giữa AI và trình duyệt Chrome/Edge: click, scroll, chụp màn hình, kiểm tra network, debug console, audit khả năng truy cập (a11y) và hiệu năng LCP. |
| **`rea`** | [morluto/rea](https://github.com/morluto/rea) | **Reverse Engineering Anything**: MCP server cực mạnh hỗ trợ dịch ngược binary, phân tích gói tin, bóc tách bundle JavaScript, kiểm tra mã nguồn Android/iOS. |

---

### 3. Tools & Frameworks (Phân tích Mã nguồn & Research)

| Công cụ | Nguồn gốc | Tính năng nổi bật |
| :--- | :--- | :--- |
| **`graphify`** | [Graphify-Labs/graphify](https://github.com/Graphify-Labs/graphify) | Biến toàn bộ codebase thành đồ thị tri thức (Knowledge Graph). Thay vì AI phải đọc hàng trăm file code thô, nó truy vấn quan hệ giữa Class/Function bằng lệnh `graphify query`. |
| **`agent-reach`** | [Panniantong/Agent-Reach](https://github.com/Panniantong/Agent-Reach) | Giải pháp mở rộng tầm với của Agent lên Internet: cào dữ liệu, trích xuất nội dung bài viết, mạng xã hội và tài liệu nghiên cứu. |
| **`skillspector`** | [NVIDIA/SkillSpector](https://github.com/NVIDIA/SkillSpector) | Bộ công cụ từ NVIDIA dùng để kiểm định, thẩm định độ an toàn, tính nhất quán và hiệu quả của các Agent Skill trước khi triển khai thực tế. |
| **`ponytail`** | [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) | Công cụ tinh gọn hỗ trợ quản trị, cấu hình và chạy các luồng tự động hóa cho AI Agent. |

---

## 🔌 Hướng dẫn tích hợp vào AI Coding Assistant

### 1. Dành cho Google Antigravity
* **Skills:** Sao chép các thư mục trong `skills/` vào `.agents/skills/` của workspace hoặc `~/.gemini/antigravity/skills/`.
* **MCP Servers:** Đăng ký MCP Server tương ứng vào file cấu hình MCP của Antigravity (`~/.gemini/antigravity/mcp/`).

### 2. Dành cho Cursor (`.cursorrules` hoặc `.cursor/rules/`)
* Nhúng trực tiếp các hướng dẫn từ `skills/karpathy-skills` và `skills/ui-ux-pro-max` vào `.cursorrules`.

### 3. Dành cho Claude Desktop / Claude Code
* Khai báo MCP server trong file cấu hình:
  ```json
  {
    "mcpServers": {
      "context7": {
        "command": "npx",
        "args": ["-y", "@upstash/context7-mcp"]
      },
      "chrome-devtools": {
        "command": "npx",
        "args": ["-y", "chrome-devtools-mcp"]
      }
    }
  }
  ```

---

## 🔄 Tự động đồng bộ từ Upstream

Kho vũ khí này đi kèm script tự động hóa PowerShell `scripts/sync-upstream.ps1`. Khi các tác giả gốc có bản cập nhật mới, bạn chỉ cần mở terminal và chạy:

```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\sync-upstream.ps1
```

Script sẽ tự động kéo các commit mới nhất từ 14 repo gốc và ghi đè an toàn vào Monorepo của bạn.

---

*Curated with ❤️ by Mcsock.*
