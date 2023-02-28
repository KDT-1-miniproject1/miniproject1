package shop.mtcoding.miniproject.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import shop.mtcoding.miniproject.dto.company.CompanyReqDto.CompanyUpdateInfoDto;
import shop.mtcoding.miniproject.handler.ex.CustomApiException;
import shop.mtcoding.miniproject.model.Company;
import shop.mtcoding.miniproject.model.CompanyRepository;
import shop.mtcoding.miniproject.model.User;
import shop.mtcoding.miniproject.model.UserRepository;
import shop.mtcoding.miniproject.util.PathUtil;

@Service
public class CompanyService {

    @Autowired
    private CompanyRepository companyRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private HttpSession session;

    @Transactional
    public void updateInfo(CompanyUpdateInfoDto companyUpdateInfoDto) {
        User principal = (User) session.getAttribute("principal");
        Company companyPS = companyRepository.findById(principal.getCInfoId());
        User userPS = userRepository.findById(principal.getId());

        String password;

        if (companyUpdateInfoDto.getPassword() == null || companyUpdateInfoDto.getPassword().isEmpty()) {
            password = userPS.getPassword();
        } else {
            password = companyUpdateInfoDto.getPassword();
        }

        String uuidComapnyLogo = PathUtil.writeImageFile(companyUpdateInfoDto.getLogo());
        companyPS.setLogo(uuidComapnyLogo);

        String t = companyUpdateInfoDto.getCyear();
        String[] times = t.split("-");
        int cyear = Integer.parseInt(times[0]);

        int result = companyRepository.updateById(principal.getCInfoId(), companyPS.getLogo(), companyPS.getName(),
                companyPS.getNumber(), companyUpdateInfoDto.getBossName(), companyUpdateInfoDto.getAddress(),
                companyUpdateInfoDto.getManagerName(),
                companyUpdateInfoDto.getManagerPhone(), companyUpdateInfoDto.getSize(), cyear,
                companyPS.getCreatedAt());

        int result2 = userRepository.updateById(principal.getId(), principal.getEmail(), password,
                principal.getPInfoId(), principal.getCInfoId(), userPS.getCreatedAt());

        if (result != 1) {
            throw new CustomApiException("기업 정보 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
        if (result2 != 1) {
            throw new CustomApiException("기업 정보 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
