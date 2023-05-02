
import Foundation

class HomeProductDataSource {
    class func createMenuItens() -> [String:[Product]] {
        
        var menuItens: [String: [Product]] = [:]
        
        let racaoGolden = Product(productName: "Ração Golden Fórmula Adulto Frango & Arroz", productPrice: "R$149,90", productDescription: "Indicada para cães adultos com seleção de ingredientes especiais e blend de proteínas, máxima satisfação para o paladar.", productImage: "racaoGolden")
        let racaoPremier = Product(productName: "Ração Premier Fórmula", productPrice: "R$285,20", productDescription: "Alimento Super Premium contendo somente ingredientes nobres e garantindo um alimento muito mais nutritivo e saboroso. 20KG", productImage: "racaoPremier")
        let petisco = Product(productName: "Keldog Churrasco", productPrice: "R$20,58", productDescription: "O Bifinho Keldog tem um delicioso sabor defumado e é suculento, feito de carnes e miúdos 100% selecionados. É indicado para cães de médio e grande porte.", productImage: "petisco")
        
        let shampoo = Product(productName: "Shampoo Granado", productPrice: "R$45,90", productDescription: "ideal para o momento de banho e tosa, é enriquecido com aminoácidos de seda e ativos condicionantes, que deixam os pelos sedosos, hidratados e suavemente perfumados.", productImage: "shampoo")
        let tapeteHigienico = Product(productName: "Tapete Higienico", productPrice: "R$82,40", productDescription: "Tapete higiênico com ótima absorção e retenção do líquido.", productImage: "tapeteHigienico")
        let colonia = Product(productName: "Colonia Sanol", productPrice: "R$20,71", productDescription: "Nossa fórmula foi desenvolvida para perfumar suavemente seu pet, reduzindo os odores naturais.", productImage: "colonia")
        
        let coleiraAntiPulga = Product(productName: "Coleira Scalibor", productPrice: "R$69,51", productDescription: "Eficácia inseticida e repelente comprovada por estudos científicos.", productImage: "coleiraAntiPulga")
        let coleira = Product(productName: "Coleira", productPrice: "R$36,40", productDescription: "Coleira Avulsa com Tag super confortável, com alta tenacidade, maior resistência.", productImage: "coleira")
        let roupa = Product(productName: "Roupa Pet", productPrice: "R$50,49", productDescription: "Tecido que se adequa ao corpo do cachorrinho, manta interna confortável e material quentinho.", productImage: "roupa")
        
        menuItens["Ração & Petisco"] = [racaoGolden, racaoPremier, petisco]
        menuItens["Acessórios"] = [coleiraAntiPulga, coleira, roupa]
        menuItens["Higiene"] = [shampoo, tapeteHigienico, colonia]
        
        return menuItens
    }
}
